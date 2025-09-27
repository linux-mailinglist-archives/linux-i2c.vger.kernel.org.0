Return-Path: <linux-i2c+bounces-13254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F27BA643B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 504654E037A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB3423B605;
	Sat, 27 Sep 2025 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k/fr7T2o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9F23A9AD
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759012412; cv=none; b=QD4LFnvs3mWg/dp5fCXvAqO/2Jw3dAauZ23MnoNU2ndNFZ6a6i1zkQ/mErJbuEzXDn/RhaYEsjvx4LU640N97/xuSqMASNHn2ILEaYr5vb6mHyi8dLeD645Fzmggl4fXkTYu47tCWelU+UTbgvpBuNmOFd7OoMK8vrTPAKzr68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759012412; c=relaxed/simple;
	bh=Sbt2L6rv75CoCrag0imLWLH7CXHlip8DY0LiuHqNm40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdMnJT3i1amv6Kwv4BljXDALfAIKSLwZDWuk+mtJUZfGweBfHf1g+uqMZ4dvESldWNNctmrCJba7wIEqNdT9+KJnSIEtLfI6jZMlzR3yt/IQUMTZo0rRRzE99GJjBr5AhFJnZwSV6BPCmjlpBhQPRN2VcCCO1CdyDJFl+KZ2oW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k/fr7T2o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OQ3t
	PU3/XvowigblqUtuwUAnQKAyH8Zve8zvWTCKrdw=; b=k/fr7T2oXqXSkF6mWCqy
	808SLXnfQIQiEBYAwmwKDLUyaK0hQhK+q28WQuLyDyxdvPSnvpqH/Ymqmhe0ZF3B
	fP62s3PPBliCrTy4JyorZCq3366wHUnw1meZIaj+LOo3Ey2RhuXDze6JInc9Jwm0
	ZYmiFD+/a2KvOdlF6QW1TFWcHDmcShf4ReSLtdAGGj749LH10Xa9eJOHwH1jLof+
	+8tEB72X7ZBqCnKGdfO8+tQtCZko27K5TBFh8QHQIk2z39ekhFEV4ULBGka1Ti8z
	xGhhegum8Hp0J9uSvA1irmUv/cZrY25PdzdC5p9Y9HZjf8jSxM62Ye9oxQLHcKFp
	Ew==
Received: (qmail 2703265 invoked from network); 28 Sep 2025 00:33:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:33:28 +0200
X-UD-Smtp-Session: l3s3148p1@Rem8/c8/nOwujnsw
Date: Sun, 28 Sep 2025 00:33:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Sven Eckelmann <sven@narfation.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Harshal Gohel <hg@simonwunderlich.de>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and
 write
Message-ID: <aNhmNxhqfWlhlXw9@shikoro>
References: <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
 <1838669.VLH7GnMWUR@ripper>
 <aNZQnlUML0jIhXIM@shikoro>
 <13214546.O9o76ZdvQC@sven-desktop>
 <3203ee4c-b320-45cf-b63c-49f589909dfb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3203ee4c-b320-45cf-b63c-49f589909dfb@gmail.com>


> To wrap it up:
> [1] needs to come first
> [2] then this can be merged

Thanks for the heads up here! I will do the following:

1) apply the patch for host-fixes now and send it to Linus tomorrow for
   6.17
2) during the 6.18 mergewindow, send my first PR without your patches
3) when both of the above are in Linus tree, I will prepare a second PR
   with (not only) your patches
4) send this some days later in the same merge window


