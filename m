Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83281C0DF1
	for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727462447; cv=none; b=kdrLUOxrJs5h4WTxzOzmme2dMRQCc3WD2/aOcApIZ9HhEg2d6F3XSNPqEjc3Bi3SYontzgMapzCaiNHAKxXmr1SZK6G/nvyEKtm/5NZxIRrnX/DIjRymRd0MU5rc0t5HMiT6slZ/+yVXtjbmOTa9YnNwT7CZkvt967PAdOcidR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727462447; c=relaxed/simple;
	bh=APV6e04IdgsWEdYen39yeummskHcbIfArwu2JHXlOTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzwyJDok6m/3m1iKvw1zy1obYBedp50LhRyLOJvQtSsUOHlL2n2h0NJSfuujOV8nbEuNXybogmS4g2X2nK4SVXTOiof9dQ4JdYLuSdhfR6ov6xrNHXsEsAdJQhg1P0V66FR9r2c0XrbXIFY5srrG26zL2ersV5rLQj/B7pLR3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0677CC4CED0;
	Fri, 27 Sep 2024 18:40:45 +0000 (UTC)
Date: Fri, 27 Sep 2024 14:41:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt@vger.kernel.org
Subject: Re: Please backport: netfilter: nft_counter: Use u64_stats_t for
 statistic.
Message-ID: <20240927144126.0dba172a@gandalf.local.home>
In-Reply-To: <20240927155656.Z-s6BO9B@linutronix.de>
References: <20240927155656.Z-s6BO9B@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024 17:56:56 +0200
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> Hi,
> 
> please backport
> 
> 4a1d3acd6ea86 ("netfilter: nft_counter: Use u64_stats_t for statistic.")
> 
> https://git.kernel.org/torvalds/c/4a1d3acd6ea86
> 
> Sebastian

Let's see who reads this ;-)

-- Steve
