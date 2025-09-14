Return-Path: <linux-i2c+bounces-12939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9DBB56834
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C31A16FEDE
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 12:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B111E501C;
	Sun, 14 Sep 2025 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBIUvd4f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15E11CBA
	for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851298; cv=none; b=isRnHZ0WimgH395MZBLTamjotAfZ5NyrLj6BRMJBRm6BubMANdl5BG+aY/PO7/A/YNBpOpIkU/iEvHRFVMyGf9vLvUBsnl4viXYrbh8Bs8gzJfyvKuS0vTOC3RPjJdSJBjsbzhkh5DrFNuJPpxpgNxIuGpzxYp7+gWWZqrNydXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851298; c=relaxed/simple;
	bh=QVrK1epjSFOqMcmLXFJpk1n4b5xh+bz113bGJLTt1Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxdqTP1hJP293JI9r9wKckECOUrps4PEV2fLKRVT+MLCdef3NdiR8gk/gfc1YE4bz2VUwbU1OVPWy/JRj+TBX2uz1H1jpZ2+T7/wx5lo+5Hr3+rgUwtjFsigdI3uGCWSUSw5f7SFDgms+GT9GI9e01KaMcsJRULxGSWfIWTCaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBIUvd4f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
	b=gBIUvd4fckGN6RTSALzJN7JsqnAWkaPUNRxZTxXlSayx2VuepzmF4aWT7uj4OoJUKz6Eg0
	tSjz/jnuU32SZUMQ7sqSZbdA51H1xKV1aPLaY/eUzGG7W5og2jE9/N+k1gDjvPzWrq/loE
	peL4G1PMZ+vdcg4v0QbxUa+Hqx8kcpo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-rFmYePz8PSSEInsZB9o6oA-1; Sun, 14 Sep 2025 08:01:34 -0400
X-MC-Unique: rFmYePz8PSSEInsZB9o6oA-1
X-Mimecast-MFC-AGG-ID: rFmYePz8PSSEInsZB9o6oA_1757851294
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870614b86so862534685a.2
        for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 05:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851294; x=1758456094;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
        b=u4GDum8AQ8DQo6rkC4icx72kjeqDLAnbmDwfPuoup38EJK4DXjSG3m3Bd6NUpLANhh
         +Wn6jPL5Chk82gF7o9fTbSHwYqqaQ2XIebMxy1l5PS94EA1ftuYOBGcoXaQcUo8+DL/g
         ql8XGoCoYjGqOB/H7dGQJNZkMmKIY2CBIFNhwoB0PIWWropcRgzTCVcrPEhDa8uuELFu
         6Grch9ciueV8q9wXcWXDcDX6wuDAVXHQSaiLEidXDwq7/U42XignyNwLIBQzU8s4+wlj
         tHg7NqP/vgcP2wCLjhnaitf9sMz30Poznlm4IqN7yEll9FuZm1hUlfoB20tkH7VG4LoK
         94kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbDnF6PZmljDpv8WAypFRiSgDSle8xT5LWUpXJF40LpDDIZf0fhHQXZE51KVrieiDFcBMlwr129r8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWtUO6Ks/JgwoZewMVfOBD5OyPoPAwfCBqzdPfRyzvyHixzZc
	R3oEKrNan0byglzfJgPbOZVxjgrFgk9sudlRwttfblUFDQdXrlva6/SXtS82u/0lG48Hhqeprx5
	wrIoKAXy62dm600FkIti7KMOKFcoUZRqXLXEz/ugv9EydhhHuceZDLljzgaS45g==
X-Gm-Gg: ASbGncvrCSjQCPlJaqBONOcCLic7LDxgjpomQgA3d5jsDOCaVGcxrKYiOZP9kzC0bSb
	7/TCc4dUoNwaHY/Rg4TFJIrIewG9v8/1hhrUf2vFUWp7kxd7qGpjhADjcppu/KMIynpuIa4vDlw
	nzu8B2mZ905ZWLUmTX8yGn9JbNpgj03j3OT2Lj/Fdg7el9YJpV2PhA964evHnw1u6xt3mM3tUT5
	/5z+FizIHHGbgDBW/3k7FnMmA8GBj/XiC3DjIN1snEOmm+CppwbOJ9SfYA6R4Do99ieZogHXQMp
	+gtT+wrlg7BTrDDLd4AL056D9+w/GQKvCh+x1nZlYrXG/GUxcAGF3mtB6BlGMYCzE1yywcJbU4S
	twUfLw+TWZckFaEc7d2/kLAqyzRv1H2Q=
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027927285a.7.1757851294093;
        Sun, 14 Sep 2025 05:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIsrBfOXyBwmvGT0Kz8IZrStEjhdVLehZi62PDrHPdMWX397mJ04MxVHeqPCuDiG+BC8R/RA==
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027921885a.7.1757851293541;
        Sun, 14 Sep 2025 05:01:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b7942d706dsm16096071cf.23.2025.09.14.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:01:32 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:01:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Message-ID: <aMaum0Lv4C9B3Mzt@redhat.com>
References: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Sun, Aug 10, 2025 at 06:32:18PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


