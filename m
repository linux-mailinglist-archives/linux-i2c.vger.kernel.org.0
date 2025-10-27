Return-Path: <linux-i2c+bounces-13833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26380C0E359
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 14:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2B24207FB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 13:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1AE3064AA;
	Mon, 27 Oct 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Zom4EKxh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687830597A;
	Mon, 27 Oct 2025 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573164; cv=none; b=Ljz2G7g38XGPzvJW9bEadGNsH5zh4MYpdXctk/ebATxc7MVFVWTjsjfNmwrEyMHDKT1gZ4UNXHyXa0LtjIl1rX8ClVHBBcEbbHmjvgO3ijMZfHpibC9Z0M1jYRtfqi766nO0DdEPnfdryoJpYkkwKTqX4CKmdvmj/6E9NDDP8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573164; c=relaxed/simple;
	bh=mKZXgmC0J5LBgztr81FWGG2KayDzmjGl5hVIlR61sKk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAecag9gwzsxMWpgn+SKb9847+f14tx8jGG+vosGpBnGFS0po+LSwx210P2mwnL7xlM25VMZcmxfPgsqfTkFtGwQ8xaRW0IMfUkgGfZhB8lH+jRleOTaKdqjcN+J/pQdYVqQNCMP18PZEcu4f90/YdWjf7Siuxc1cxO/emxKYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Zom4EKxh; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761573153;
	bh=3kzLSOuCsNwd3PzYAldLRKtwAf4LDDOP8IpojHoSDqA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Zom4EKxhkk0iWK5+i3HgvWF1OGkldxxuwR1H06v/WAki7s4cNLSgUvlRMMaGFZzyr
	 xRgOyIdYcqjU+IqBLy46bs44SjUMCm81D/Yy3fdWGNSJoC91ME+6j0bgn1PWmlmTZ/
	 3HsqubF6BKxqhNCprBWN29BZhmXkm5m3no+xtaD4=
X-QQ-mid: zesmtpip4t1761573148td27e7fff
X-QQ-Originating-IP: UrvBgtWjK2nHPKDaDc+5eztGAGq+puoGJrqONWDB7do=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 21:52:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3589194371110630699
EX-QQ-RecipientCnt: 14
Date: Mon, 27 Oct 2025 21:52:27 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <DE3BC758D99A2110+aP95G3ppc_mZaDpq@troy-wujie14pro-arch>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <aP9IVckJT-k2_O4K@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP9IVckJT-k2_O4K@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mh0xRtMdhgZRanLwuwAVcqmp1P5pal50KAfMbD3eUBhbrg5PthVOPmEf
	sGCN4jmRdbbe5xpLy1i2t+h30110rqU3JDOIWeHHzRRD60R2HH+2BHxviT2E0WSmyEwlnId
	CC0jO8m1mZ/IBWmmc5+6nERrwOOdw+eHvVboDE+E2Gm21uXExF9vHLiV+62SCxpZBFp6nKF
	onSpJLykJBQnVJ0IglQ/pe+ngk1wkw2+8N76DVd7W0c7Ho3ak2oxLpgxRPowcq4+9CPj9/n
	6DENo9CAn6S+3yrMXpnuQEZEGeY6BY8fo12HTF7vKHq4zkAqOnoNgj1igiwpVhxhz+zWtw5
	1VApAhZD1W80QnYqz7ZOJOx+v/RT+RaA1SRjUbRJbmSUOBfq4TcIdp8DVGMLsErq79dlGeN
	8Pu26+hhV1+YTtJpLOuGNRhsa7PFC3/y8l9+ueD3dPVxcFZ4YX0rP/jfK8m0Jk5TQsh2M4n
	R/G9DGS3LvBzj3nzlcJfVvgOk+l+LZCiSsGOt/GHQg6ec2NjBL6Xuj3gviWnnmviyupOEVN
	qzqUvYy/NAhgJ6HwNQ+Jqqwtb2P6Q0hp/DpFW+Ke+SNCnuZ+eNZlmLDcrymbM1KUHV9TxYf
	RHxFbhLw4KD3V9xzNNz22a+HfDST0HzhMQZi+YCDdnkn1io1r3TybjQCCHUCiVE4+sIV69F
	V9sO4pIRinHvLbIj3x9WLT6UWl/z6rLx9SgEgsIHYr1qoPbT1nMaB/VprXxq7wKKH2gjU0I
	/8E6NLCir7Of0PZiWQ/rh7EeqD3/N2clFkDdmC8FWMcevvrWI41xAdUfZPpornXRyM0+sfD
	bWptv9DdWT/yo8yi6o0Lbjreu5OT8XKxuwpdtsSDCO1A8/IU7yEUD7wtAj2lYe3bO8wwhxG
	1QgNzitFphMUzcFKn1efkit0E4kFrfFKIsaVIOuJGgUduzkaZIZG0ovBhLx7ZDphrJunTNm
	oe8aYjAEekfdG7ZLnjm1e9GGvqx2gqgZuEAmsyn76Twb71DMFzCIGFruu3YFM237WIsbk47
	JheZa21s+p/n7/YhbEVzJavzd0pbtJdyKZGF/yrzAkgzn5jqpMBD7pemfRgH8ivUMbcbL9B
	CQTufCOfcne/7aJsNllQ3asTFYIBG4Xjg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 11:24:21AM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-27 13:48, Troy Mitchell wrote:
> > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > 
> > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > patch has reverted by maintainer [2]). In addition, the Kconfig for
> > P1's two subdevices, regulator and RTC, has been updated to use
> > 'depends on MFD_SPACEMIT_P1' instead of 'select'.
> > 
> > Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
> > Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> I think this series misses a patch to add a default value for 
> MFD_SPACEMIT_P1. Otherwise it doesn't make sense to define a default 
> value for the ones depending on it (RTC_DRV_SPACEMIT_P1, 
> REGULATOR_SPACEMIT_P1).
Yes, I forgot that. I'll add it in the next version. Thanks!

                                  - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

