Return-Path: <linux-i2c+bounces-11594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A360AE9002
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 23:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A87C5A0325
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 21:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1109520F076;
	Wed, 25 Jun 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9j7sG+l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204820C46D;
	Wed, 25 Jun 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885849; cv=none; b=tziVBK5kD3zR2iC8KLuXo/RCM7CNSMZADpGWlaWOmpvLM1HznGt1hYQ4Ge3Yh1zyunVqQyl1Xg2Cx6rTF6mxLoA0E/lwXTlmNxd0SqCZy2qs8NqOWmEvoFy8f5hdhpl/ovWHD9gCGJJIWv4lcesGfc9q2kBJh7ba2CDv/J+cR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885849; c=relaxed/simple;
	bh=CdZaIG6cxotiCXbEsy417Cx3IBnw+TAhglshYAGkRaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnTt7I6+UY7ops8YuhMSvAqKSfTQEm0SKousr7A+JwuRhRfc7WDuZVPZQbTQ4IPYwvWMWUp0kjPmh42vyONjV8rvl50LOljRdp2UWttX5v3sEahK3CqvaWk6VGTpGCZOoo6CAmovjTLQS4z2PBidINAebA32lxpqJfQjnsWQUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9j7sG+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0CBC4CEEA;
	Wed, 25 Jun 2025 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750885849;
	bh=CdZaIG6cxotiCXbEsy417Cx3IBnw+TAhglshYAGkRaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9j7sG+lbV/z/3Qr/ejg/YiL9FUMtkF6/V6l+/Shtq7Ls80WDr3FIqh5Oa1Gofg3r
	 omrnsCGupI7SofgUm1tLRRcI7y/hcvS741P9rM5gR+Zmfanj7OU36hckuqK7q1Si2l
	 9QU7qyPPqApIjB/047dP+8SI0+el38nF7pH81KWI8Irw6iRdwReV47OqptpyK7H5Y9
	 JuMgJ6h/LMPU2FM590G8nYr7z2S8Tjyiue+tLVqD9Eeug1rYcmY0nuKVP6vkk1gmhh
	 fECW3Fo3gOOEAn3pxjO2D3+x0ZbXyQM2A1diysl2ReT/38Qm6KjEWjted3eiml99Av
	 GlqzrE+E5sz/g==
Date: Wed, 25 Jun 2025 23:10:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, rdunlap@infradead.org, 
	Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
	linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
	gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v4 3/3] platform/x86: Use i2c adapter name to fix build
 errors
Message-ID: <4exmux33fq3nyene6qbjgtum7e7zczqvzf4aqimyszzlztsewm@hvl7umgvvlov>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
 <20250609155601.1477055-4-pratap.nirujogi@amd.com>
 <570c7765-b3bc-77cd-dddb-d19e85611114@linux.intel.com>
 <2a74c711-0d9c-8013-dc92-82ffd0d7d416@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a74c711-0d9c-8013-dc92-82ffd0d7d416@linux.intel.com>

Hi Ilpo,

On Tue, Jun 24, 2025 at 03:07:16PM +0300, Ilpo Järvinen wrote:
> Hi Andi,
> 
> (ping)
> 
> It seems by now people are starting to send workaround fixes (build only 
> with =m) as this series is still pending and compile is breaking because 
> of it.
> 
> I'm fine with you taking the entire series through i2c, or just let me 
> know if you want me to take it through pdx86 tree instead.

Sorry for the late reply, I've been off the radar for some time
and now I'm catching up. I will take all the series, thanks.

Andi

