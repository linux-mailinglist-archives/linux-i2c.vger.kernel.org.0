Return-Path: <linux-i2c+bounces-13206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E597BBA436E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 16:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE51A7BDCE7
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 14:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F3D1C84DE;
	Fri, 26 Sep 2025 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XSqU27En"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CC1CAA7B
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896942; cv=none; b=E4+COscCCn7fZs0nApe6pCJII6bqGelbWfp7OIBK646NxGhAuzR47FBWVn8h1s3sAUfXKBgvImuabvkNGizkgZ8k2PQQkIXonVYzZYdSRkFO+6YCTTjcxAMUzQ+wStFkYetEPqZsokdRAxlfstJyniYkx0njxEVVt6b8Pa8BFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896942; c=relaxed/simple;
	bh=00v6MirzP4QEvBylEctFh7muMmPA8J8nPJMfbun/HSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7HkuJWF2bABeiWo4slgZlE4AC1RA6Dfhxy/1MnsOhf4JcfK0lxcymiueKovZR3TbNCuRFrvO08Lumltjm40E0xqjQ4azDId5/q0iSrliteZT7cPl8tNDUJersRnNMjib7cfhEWcmS8jD87pqK58HEBS4BfDwEoMoblcWDxLYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XSqU27En; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=00v6MirzP4QEvBylEctFh7muMmPA8J8nPJMfbun/H
	SM=; b=XSqU27EnmXYl3Tz0pztgPK16Fl4QqKaVl6BSonzIg4xyoSnBLqf1Mq4mH
	v3gRIeqIxEegnAYqEUwrf8GfkkEvlen6JZiS3w4OMB8Ci3xfKFSCThJw4pvlJNC2
	5u/svt1LFakI8Mpv/wk9YD0gQ6DrO2AcnD2/agQWofElI/hlbFqhOPFp/Z4mpQl1
	Mati5ivvH3rr3hI5fiTJ6L1gxKVzjcP84d6Dw2Yn2E0ERxMu58m3WvwufZwdwCCL
	THYQ7mv36T5wyFtY0sYYIVuQklkCfOs59TPgMpyK3y47uFY3BSrQdQfBDy9Rf9jc
	h9zGPoX5Lf3iRQH8+t1MR2UDG3eJg==
Received: (qmail 2289488 invoked from network); 26 Sep 2025 16:28:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 16:28:56 +0200
X-UD-Smtp-Session: l3s3148p1@wt0NG7U/RsogAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 16:28:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <aNajJ0RZ4Ku0eDXr@shikoro>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>


> Since patches 1–5 have already been merged,
> should I keep the current version number and just send this single patch ?

Yes, please.


