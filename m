Return-Path: <linux-i2c+bounces-12027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11EAB10EAC
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 17:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22AE73B9C3B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 15:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70742EB5A7;
	Thu, 24 Jul 2025 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SrsNP8Pr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833112EACE3
	for <linux-i2c@vger.kernel.org>; Thu, 24 Jul 2025 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753370778; cv=none; b=RfmtxAyVN7AWuA+aqoj+rp8nH19Bmu4MxHzQrYAc+6Ty4zbtehsDavihDGnTa3Kvn98WdDXanxZ1WgLQY4jrmet5ZewZpyip1KZz3Z+6cJqTmywNGBngny7Ec+XWRTWWSge7jwRJh4feL+KUbOtlee7oOXWKgWhOWAnXcOX1S4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753370778; c=relaxed/simple;
	bh=1xV5Fwp5TtgCJdKbpRZ8vKhWuzwiXh7c/R+wfHW3WHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oohMZRtKBjD5qSLrJG0MRRxTZWzIW0YYjv45mYr7pXe7VG9pMs5l3YiZNpb8+Gp3VgdrVv1hao3Too19iZVxQ5PfmFH9QILjK89+YmDNX7lnSrzCE1ikgDVn7eaHCcopZuIoveIVyWkJ1lAZzJq0cUOP17Ve1U3Zs+JkKuXbVMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SrsNP8Pr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1xV5
	Fwp5TtgCJdKbpRZ8vKhWuzwiXh7c/R+wfHW3WHc=; b=SrsNP8Prk3gU8tfpxXzS
	+pOfzvFH9AeEhSXWAqPUKb78X1d13CqlnHuUSiOCyIJ6KglYKPMN0G2KyCKUR7as
	Apj0L8u5NYPockx+Lc99vvXebmltnYZ8wFKZjIiNSLLK3QH6U9f6YNaBXrOp0/ul
	pYw8LwMA7aNii+WCQKGRCkSpzdwg6os5kjWQrbELgquoLUksbKlvgrOhcCPXQ+qT
	56cET/vZU8ZZgeMdrKVn+FLjn56H8uAvE86tCDDuVFKA6fg2U2yd+vnpvHKG/pPx
	rGXiVngJAgntsaixJQyxjLTsFRaDReQA0YKdNozpZjmSAT4tl1pMVgpADeAWYAnM
	vA==
Received: (qmail 2116903 invoked from network); 24 Jul 2025 17:26:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 17:26:11 +0200
X-UD-Smtp-Session: l3s3148p1@tTABcq461tAujnss
Date: Thu, 24 Jul 2025 17:26:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: syzbot <syzbot+4687ab80180e5d724f51@syzkaller.appspotmail.com>
Cc: andi.shyti@kernel.org, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] WARNING in osif_xfer/usb_submit_urb
Message-ID: <aIJQk5ArP19m82td@shikoro>
References: <681853be.a70a0220.254cdc.0045.GAE@google.com>
 <6882450e.a00a0220.2f88df.002a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6882450e.a00a0220.2f88df.002a.GAE@google.com>

#syz fix: i2c: robotfuzz-osif: disable zero-length read messages

