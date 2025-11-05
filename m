Return-Path: <linux-i2c+bounces-13963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1DC3585F
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 12:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3927B4FC1A8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 11:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA68A31195D;
	Wed,  5 Nov 2025 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iXJ+NqGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5A2FA0DD
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343493; cv=none; b=bpwCnIDVpuncNv5m/VIi24cniREWfcBXkHi5583QTakHV4lf4CoA/jQLgaXEQmR6RVXBWNGRZxEqJVwuscjrWdATlXqVrK7EB6F+iS9JCUNl1TaN2v2Hm7qyXGeXgHljv4vyqfaX68qHKeSK/lK45noW8T3xipwsCf9jEbopUMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343493; c=relaxed/simple;
	bh=0zZZkZEbMwbfbztEt+depDh9rnfDLoVeD2nEyQcZy3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEHVWh5cLslciEGNzHm+JhOZyUp/gWYI46xvVaoIQthiOcUHIbwd8pZQl/ad7DetOK98UKdPZ9iP6k2rJMkqQ2W2NNsC4W60LLan7KyNWAlwmQmuruWLoaKFeN84LB1ULQV4hHfat5RJtQ4WVO3kDeYE4F/LokFYHSUzoivMhok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iXJ+NqGo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ebs8
	q+Zhkz66rPrltv/PRIcVR13h8mXvCH9YO5ah/jM=; b=iXJ+NqGo3cRySRjlrr7E
	DTSdpXkQtzffhxQZ6Q+44owc2Vtwm9M1aOC9GGuyTaQoGh78/pXmk4E02KvyStGq
	wWxEtoVUy1WnG4DdBg1Dewk7SaAIKNBCG/Uy0732KZL0+qJFl4IDIx1A6/chXGDM
	sx/S/3Hj60Udx7b1Q1Q9UBoImVljYbWtrffEK2du98YlJQomtG9/1Ggid6AwgYvf
	TIYavlaRv8KImrPNenMA309ewpCYf4JTy60P2MRrPZIKXWOTGfn2sE2g2fJqeay/
	xmYxwqGhUD+rERgsTh7x6Qa4q84mQEtAQNGrbJw6WyI+am/bbvDGQslxtQFjROCM
	iA==
Received: (qmail 3053310 invoked from network); 5 Nov 2025 12:51:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2025 12:51:24 +0100
X-UD-Smtp-Session: l3s3148p1@9OVSkddCDtEujntX
Date: Wed, 5 Nov 2025 12:51:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with
 i2c-mux on i2c2)
Message-ID: <aQs6O75BqOERMzPJ@ninjato>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
 <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
 <aQfgEuelvU-8_2rh@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQfgEuelvU-8_2rh@shikoro>


> > Maybe this option should be enabled by default or when the i2c-mux is
> > selected?
> 
> That's what we were discussing. At least a warning will now get printed
> to the logs when booting suggesting the above solution.

FYI, all the commits leading to this breakage are reverted now. Sorry
for your troubles!


