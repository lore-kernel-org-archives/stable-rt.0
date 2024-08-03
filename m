Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56E847B;
	Sat,  3 Aug 2024 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666019; cv=none; b=H1qDPDXDVI4ZUUU0MVUbQhyHsTJ79mWOm7c/Q3UEa0/cZoiplXAfsmvC7bEeQLabRbtXUO41P8CIpCQd+qN338DA2IyvOEr6XZ/Z/BUX09dE4cka7Fl4IposqARQyiq0/CuspflqGEDx0rXU5E/WVOvqUvOqU0vOcbYrGzj2cNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666019; c=relaxed/simple;
	bh=Fg1nh2vMMPSpYRokeN1l3zNGY2cK5TcfaFLm26xBCtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjCNstMQCPlwwE3KDuUW/gvW3DGOYwr6FTyZyLpdqHifvAKqwUwbl986MHqK5hUSIMLZzbuT9q60FrRn02VVn/lTK/OECb1UHIlSADA7gkfjPmGyPqKl6lITG530Lxau/vPCQ9TJzBEe2WNmYZ2G+c5ZlddLay+KdL61EeAGP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sIgYOeDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sIgYOeDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8B8C116B1;
	Sat,  3 Aug 2024 06:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722666018;
	bh=Fg1nh2vMMPSpYRokeN1l3zNGY2cK5TcfaFLm26xBCtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIgYOeDKFhWSVnVVd2w3luNxbXpZij7i+tD6sfPD/1UOnUaAzQI0wf0eSLDgwVvnM
	 1XaHYhn4/6hyxu9ZVHbye4AeZNfZrFyrG2xsxnGPD9YoY0mr295Vv+DVDvimlBVbNr
	 5zb8CTCwzUPKPaeh+4slGjjAU7N8OpBCNIQJzLzE=
Date: Sat, 3 Aug 2024 08:20:16 +0200
From: "Kroah-Hartman, Greg" <gregkh@linuxfoundation.org>
To: Clark Williams <williams@redhat.com>
Cc: stable-rt <stable-rt@vger.kernel.org>, stable <stable@vger.kernel.org>,
	"Claudio R., Luis" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: CI build failure in v6.6-rt
Message-ID: <2024080344-division-undertook-4905@gregkh>
References: <CAMLffL9t0SFkO90d6pFZAwp-WVbont7NgELx_WW-GRRYkF_QXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMLffL9t0SFkO90d6pFZAwp-WVbont7NgELx_WW-GRRYkF_QXA@mail.gmail.com>

On Fri, Aug 02, 2024 at 08:46:55PM +0000, Clark Williams wrote:
> Greg,
> 
> Kernel CI is reporting a build failure on v6.6-rt:
> 
> https://grafana.kernelci.org/d/build/build?orgId=1&var-datasource=default&var-build_architecture=riscv&var-build_config_name=defconfig&var-id=maestro:66a6b448bb1dfd36a925ebef
> 
> It's in arch/riscv/kernel/cpufeature.c where a return statement in
> check_unaligned_access() doesn't have a value (and
> check_unaligned_access returns int).
> 
> Is 6.6 stable supporting RiscV? If so then we either have to fix that
> return, or backport the refactor of arch/riscv/kernel/cpufeature.c
> (f413aae96cda0).  If it's not then who should I talk to about turning
> off riscv CI builds for v6.6-rt?

Why not ask the people responsible for the -rt patchset?  If this isn't
an issue on a non-rt kernel, then I think you found the problem :)

thanks,

greg k-h
