Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC4199239
	for <stable-rt@vger.kernel.org>; Tue, 28 Jan 2025 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738104689; cv=none; b=qsPMt/IwwTsRzIvL64pcTvhxLq8gsdmHziFUmGe2CjuFnKo0y9ZR1oaElYI8+W18XOZd/q98AN3ydZAotu7U84eQAKElJDunSRqdqsqJXrnKmN5dYtHOb6qWINudvvBWd7Q0QVC93h4NZLH+dgY6ISwN5K6JPpcxU7J7hbroMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738104689; c=relaxed/simple;
	bh=IlMtlWAKI5victnzr45Mf5dw+XpeFzHn2Gj7IcNC6lA=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=aFhGK8sl+lD67cOSOWNdkW0HX6LHRhIXJYIMW8Nhll1zvxa8V+2mLdNiYMvHyPk6We+lj5vzZmQGIrV/bbltpDLP9pBXeDgag2CB9ofH1aLIlQ0/UcLY5l+zn040E1iYT//wgt6e+2SM/Jh2LXfJGxoUhiti+iCjsHS+AV3JTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=u6d3yhE9; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="u6d3yhE9"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso8614282276.2
        for <stable-rt@vger.kernel.org>; Tue, 28 Jan 2025 14:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1738104685; x=1738709485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XrQjY6i5ZtJbQJ1oqShftLNGTvolk5ckc2Dswha3aos=;
        b=u6d3yhE9qsQc5BBrp1kh80ipKdTF2QXLSOO8hl2M1mrLxbslAHCY6oTFEdS7T/XaTr
         I+taRo7cWLmZ16s0QVUlMvV82CxV7KXUv+aI+Rt6c1TaaurbBDWGZV9Nmlxce0ukpI1H
         oi6o/QXTwgKQgk0vQFzxnm3B14+sIbwQQ8izkZLNwvGC1wt96u0EYP3ns9sINDI+xXLH
         wv6lnzTUyIKsCqM6s1eEfv2cJpB9SXStE2NTavI6a1YdP/pYn4FrtLgLq9lKhe4fJM+D
         4SEVFQ+GwZrV+j1SwJjWbLe5nJz0CuJNOBUK0rqMMvDLl3qK4BxUh3wRpgunGYLn/GuA
         8qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738104685; x=1738709485;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrQjY6i5ZtJbQJ1oqShftLNGTvolk5ckc2Dswha3aos=;
        b=FJHzTucMa+D+c1ywyzTeVKcTCN0Gda9KATrS/cAFV3xWSfA89CkCp9VDPr2DO032En
         gyCJ2brLVa01jcYLB+8VvEzDdD7XAUwWUuDqk4eiD4PMiDFevqQ6TX+Wt7ALNmflUgWP
         rWO1rBfAUPJPdrxWhAcZDm8HRxtgMbrR+wEW5w/n3EMYVnYbzvtxRvFZTvinDn/uyfew
         20ItxDjqxL89uTWJFhtnoDVCmWiElH6vgql9AA1QymiekwZfyqaqwibzCmcQ9GoDknIs
         30ihyyTzSLxnmzsuWOi+tLNlmtntM0Fa0qV9q1wZ4+OpEueJ7PSreCbXLcv5VHPSsK0D
         wruw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1ctFeXmw59b+w4RDOViKWhaUHvtL7Y0hEUjqZmQXl+VeSP1ntz5sr32cBrSZcaNa3omPGhaV84U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZf9JTsX928x0nAcU5l836VIe0ZJBmkIBD+oQUx9kIVsFAwxf2
	zbdKuNo2R1sht6ec9aelLgE/jv22g/OInQXV3qVj5BZb/Hf7vKlOgCs1avi9ZCs8tkHHKlMcGCV
	7T5Ax7zbX8rUHipKrtDl8wE8deN68eKGme7TqKQ==
X-Gm-Gg: ASbGncvnPcoBEaxRpqrFI6LZ9nIOvaD/zWZISTGKZPb34El/+8Fv9RkbUkssq90eF9w
	4IZC7992heAJ7Ek9HTP7YSDh2uIoEDuD2PAOMj4WwtdEZoLhexN8SD1G4OkDD4x7DyEezao/a4A
	B6YKtty+vVkDl5SutiFLhnJISzNDvadg==
X-Google-Smtp-Source: AGHT+IHaUWTISp9DilwKZzE2isXVRw35ht/v9n3knN7WwI5ps2bUGjkGt07mxE0inl6/YcQ0IdxLg3mS894jeB76KVk=
X-Received: by 2002:a05:6902:11c3:b0:e57:3e89:5d5b with SMTP id
 3f1490d57ef6-e58a4b48e77mr778433276.27.1738104685570; Tue, 28 Jan 2025
 14:51:25 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 17:51:24 -0500
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 17:51:24 -0500
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Tue, 28 Jan 2025 17:51:24 -0500
X-Gm-Features: AWEUYZnQG7zRwKyLRLzs50ihg4n_sjNwxWZGyhwTtV3RnGyr0l0Im16TTIqQAHs
Message-ID: <CACo-S-1AJ1JnKbnKWWiMGiTfS9NifqkjUhyTKY_imqJvrOC-mw@mail.gmail.com>
Subject: new issue on stable-rt/v6.1-rt
To: kernelci-results@groups.io
Cc: gus@collabora.com, stable-rt <stable-rt@vger.kernel.org>, helen.koike@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New boot regression found on stable-rt/v6.1-rt:

 WARNING at drivers/base/core.c:2508 device_release+0x80/0x90
[logspec:generic_linux_boot,linux.kernel.warning]

- Dashboard: https://staging.dashboard.kernelci.org:9000/issue/maestro:701cda418eb650a69618338785a8d492bded338d/version/1
- Grafana: https://grafana.kernelci.org/d/issue/issue?var-id=maestro:701cda418eb650a69618338785a8d492bded338d

Log excerpt:
[    7.346263] Device 'mediablk-mipi-dsi-1' does not have a release()
function, it is broken and must be fixed. See
Documentation/core-api/kobject.rst.
[    7.346290] WARNING: CPU: 0 PID: 9 at drivers/base/core.c:2508
device_release+0x80/0x90
[    7.346299] Modules linked in: caam flexcan rtc_snvs error
snvs_pwrkey spi_imx can_dev governor_userspace imx_bus pwm_imx27
imx8mm_thermal imx_cpufreq_dt
[    7.346327] CPU: 0 PID: 9 Comm: kworker/u8:0 Tainted: G        W
      6.1.127-rt48 #1
[    7.346332] Hardware name: Toradex Verdin iMX8M Plus on Dahlia Board (DT)
[    7.346334] Workqueue: events_unbound deferred_probe_work_func
[    7.346340] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    7.346346] pc : device_release+0x80/0x90
[    7.346352] lr : device_release+0x80/0x90
[    7.346360] sp : ffff80000a71b910
[    7.346362] x29: ffff80000a71b910 x28: 00000000fffffdfb x27: ffff0000c7634c80
[    7.346372] x26: 0000000000000002 x25: ffff80000935a2f0 x24: 0000000000000023
[    7.346382] x23: ffff80000a58bdc8 x22: 0000000000000000 x21: ffff80000989f6a0
[    7.346392] x20: 0000000000000000 x19: ffff0000c7634080 x18: fffffffffffe6658
[    7.346404] x17: 6620656220747375 x16: 6d20646e61206e65 x15: 62207473756d2064
[    7.346414] x14: 6e61206e656b6f72 x13: 6220736920746920 x12: 2c6e6f6974636e75
[    7.346426] x11: 2e7473722e746365 x10: 6a626f6b2f697061 x9 : 2d65726f632f6e6f
[    7.346436] x8 : ffff80000a184240 x7 : ffff80000a71b720 x6 : 000000000000000c
[    7.346448] x5 : ffff0000ff769a18 x4 : 0000000000000000 x3 : 0000000000000027
[    7.346459] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c00c0000
[    7.346470] Call trace:
[    7.346471]  device_release+0x80/0x90
[    7.346479]  kobject_put+0xa4/0x120
[    7.346486]  put_device+0x14/0x24
[    7.346493]  genpd_remove+0x118/0x1bc
[    7.346500]  pm_genpd_remove+0x2c/0x50
[    7.346508]  imx8m_blk_ctrl_probe+0x370/0x4cc
[    7.346515]  platform_probe+0x68/0xc0
done
[    7.346521]  really_probe+0xbc/0x2dc
[    7.346526]  __driver_probe_device+0x78/0x114
[    7.346531]  driver_probe_device+0xd8/0x15c
[    7.346539]  __device_attach_driver+0xb8/0x134
[    7.346546]  bus_for_each_drv+0x7c/0xd4
Saving random seed: [    7.346555]  __device_attach+0x9c/0x1a0
[    7.346560]  device_initial_probe+0x14/0x20
[    7.346565]  bus_probe_device+0x98/0xa0
[    7.346572]  deferred_probe_work_func+0x88/0xc0
[    7.346576]  process_one_work+0x1d4/0x330
OK
[    7.346582]  worker_thread+0x6c/0x430
[    7.346590]  kthread+0x108/0x10c
Starting network: [    7.346596]  ret_from_fork+0x10/0x20


# Below is list of tests where the incidents where the regression occurred:


## boot failure on imx8mp-verdin-nonwifi-dahlia
- Dashboard: https://staging.dashboard.kernelci.org:9000/test/maestro:6799439265fae3351e2ee335

## boot failure on imx8mp-evk
- Dashboard: https://staging.dashboard.kernelci.org:9000/test/maestro:6799439265fae3351e2ee332


[This is an experimental report. Please send feedback in!]

Generated on 2025-01-28 22:51:24.671823+00:00.



--
Problems with this report? Let us know at kerneci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
