Return-Path: <linux-i2c+bounces-1216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE688272E8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 16:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BC52815DF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A605100B;
	Mon,  8 Jan 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQiyvUGx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F275100F
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704727380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3enDL7x023hK73qHzko8bcPLgiHS6A4R6I0TzQHyeIw=;
	b=YQiyvUGxm7O64T9NKIg+6Hab16KCU7Fo6gcbURDoiczJISl2KFLEh/C6u8924409W7XoJK
	s8AtZwXN0aShD/J4cYI6A6AFtyyBjRWPxaFmJlkPFWsm3+y7Mg9Osl2EdvZfqzLpAV5HPZ
	RstPYPv5FgTx90l5Jn6uBgXkqG/fe64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-AsVr5KxYOGOKJszzpXCHOQ-1; Mon, 08 Jan 2024 10:22:59 -0500
X-MC-Unique: AsVr5KxYOGOKJszzpXCHOQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e412c1e65so13603565e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jan 2024 07:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704727378; x=1705332178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3enDL7x023hK73qHzko8bcPLgiHS6A4R6I0TzQHyeIw=;
        b=nZMsXEcOJxhHuP9+ounY/ViUp73FTmMgChrA/T/ZlNcgs6u3Hd6aN6/EtlxUViM5hV
         5QUy/4cbJqjX0saZBLimn0EpZB3GC08WbdNGYOSxzri7ngbfOALDMHjZE/+2JOnn0Q84
         2mNQKiAz32tKB5FJjxFD8sH0OhxTj3s69Rc/OEh/Q3mZGEMrYmT77ra21kvJouK7EA3J
         PMCurXt//xO7t+upd2H9hRJfdgn3MF/3E77FyOGNh9qRN+yRW81eKrXZoJ9TDpyPLsLr
         GX3ttW1eEYdLO9Ex8ySXoNvKi+c81MHUXaHLJiSByx/7BrnWlBJcxKVXMh+0VUQywbGZ
         FZTw==
X-Gm-Message-State: AOJu0YxxsiWNF23vPDYemxfRFKh5mWrvbPfQX4zdwRIszq4dDVhMQ2Yq
	VqqCXlhxYneVIjoZW+tqiWyrL2Ws8YcLg5+P90Z8FMXCE0r24VikczYjrCISmMPJFh3H1qS3PWI
	26jWhDJM8CldmPlLtF2F3sLaRb+v9
X-Received: by 2002:a05:600c:1d04:b0:40d:725a:6c6 with SMTP id l4-20020a05600c1d0400b0040d725a06c6mr1870044wms.181.1704727377951;
        Mon, 08 Jan 2024 07:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLgnyWwGaP080OeFHL083gwhbKCqxQGYZMDZnlnk5jj2aUHAnsOkysg7x7CdG10adAUk85BQ==
X-Received: by 2002:a05:600c:1d04:b0:40d:725a:6c6 with SMTP id l4-20020a05600c1d0400b0040d725a06c6mr1870038wms.181.1704727377609;
        Mon, 08 Jan 2024 07:22:57 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dt12-20020a170906b78c00b00a26c8c70069sm4032236ejb.48.2024.01.08.07.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 07:22:57 -0800 (PST)
Message-ID: <e8e0d636-081c-4953-b1c9-d9514b366cda@redhat.com>
Date: Mon, 8 Jan 2024 16:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] platform/x86: p2sb: Fix deadlock at sysfs PCI bus
 rescan
Content-Language: en-US
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/24 07:20, Shin'ichiro Kawasaki wrote:
> When PCI devices call p2sb_bar() during probe for sysfs PCI bus rescan, deadlock
> happens due to double lock of pci_rescan_remove_lock [1]. The first patch in
> this series addresses the deadlock. The second patch is a code improvement which
> was pointed out during review for the first patch.
> 
> [1] https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
> 
> The first patch of the v5 series was upstreamed to the kernel v6.7-rc8. However,
> it caused IDE controller detection failure on an old platform [2] then the patch
> was reverted at v6.7. The failure happened because the IDE controller had same
> DEVFN as P2SB device. To avoid this failure, I added device class check per
> suggestion by Lukas. If the device at P2SB DEVFN does not have the device class
> expected for P2SB, avoid touching the device.
> 
> [2] https://lore.kernel.org/platform-driver-x86/CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com/
> 
> I confirmed the patches fix the problem [1] on the kernel v6.7, using a system
> with i2c_i801 device, building i2c_i801 module as both built-in and loadable.
> Reviews and comments will be appreciated.
> 
> Klara,
> 
> I hesitated to add your Tested-by tag to the v6 patch, since I modified the code
> slightly from the code you tested (I used pci_bus_read_config_word() instead of
> pci_bus_read_config_dword() to avoid a shift operator). I hope you have time to
> afford to test this series again.

Thank you for your patch-series, I've applied this series to
my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Note I have re-added Andy's and Ilpo's Reviewed-by for patch 1/2 since
there is only one small change there.

Regards,

Hans






> 
> 
> Changes from v5:
> * Added device class check to avoid old IDE controller detection failure
> 
> Changes from v4:
> * Separated a hunk for pci_resource_n() as the second patch
> * Reflected other review comments by Ilpo
> 
> Changes from v3:
> * Modified p2sb_valid_resource() to return boolean
> 
> Changes from v2:
> * Improved p2sb_scan_and_cache() and p2sb_scan_and_cache_devfn()
> * Reflected other review comments by Andy
> 
> Changes from v1:
> * Reflected review comments by Andy
> * Removed RFC prefix
> 
> Changes from RFC v2:
> * Reflected review comments on the list
> 
> Changes from RFC v1:
> * Fixed a build warning poitned out in llvm list by kernel test robot
> 
> Shin'ichiro Kawasaki (2):
>   platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
>   platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()
> 
>  drivers/platform/x86/p2sb.c | 183 +++++++++++++++++++++++++++---------
>  1 file changed, 141 insertions(+), 42 deletions(-)
> 


