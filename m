Return-Path: <linux-i2c+bounces-11686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B28AED3A6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 07:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A724E18947AC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 05:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76568191F92;
	Mon, 30 Jun 2025 05:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmS2Fw2G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FF1FDD;
	Mon, 30 Jun 2025 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259772; cv=none; b=J/sstf+59woIU9N97M/lT4mzR4aI27xqh8T3JoBFd5dGwxRcs0kNoNMLB71LVhGzrwMowxIB78HXNuSpBwH3K+uo76sQCVKn9JM1/+Tus21cgkuQqdApPABYicXBrpvcy6vjPOoqLWX1REb5yDRMzScQwjYFre+sXZ5U4WRG7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259772; c=relaxed/simple;
	bh=5VTdQ4tGtrefrn2S+93SpE0Y+HCmh+YKtuLUej5R6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFuDn9+hrAdEPtY6bwSQsW0gSRiBouR5kqkQelBqUCKWNPdJI9COGILPc3MBFAUn6WGuNEHg+gHHGPc6R/PwfxM8a7H/9VI7RSL9+pezljDo3RmRicsCCZiUTtSSoBsXn0YvlNRbWIXZpVy4nqOEgxWVP9s1eVWIJaDrjtaA8xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmS2Fw2G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23602481460so39240355ad.0;
        Sun, 29 Jun 2025 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751259770; x=1751864570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k14vHInxFXfvWiA3yiBDXZSY6za1W36jbGVMCLDj9aM=;
        b=NmS2Fw2Gva9xt7kq0M2uJfYhSPTu4fR/+snZ3x5jhn0yOFngl5cjVbpkyUi8mIb38v
         xSiiYbO4fbFZEP/zOXpkGNotTiuU1RhjtKa2rxGiyH8tXeK+5z9U00RtAtWZxFArDxbn
         VwWNFN5n1oQR9bbHkAOw/3CXFS3p5m89ZmHfAwPHgSko7CBngCJgOaqXmrKZv+WpunN4
         uOIqq2V7SdoioUegdVe9TlPbhInWUmiYOD4UJDs7ssqJGOn8XYXM/tyrST8f9qjuVpkn
         jBXbA8R4bgryh1deQ2hfRIBT2rxjHmdj0cnvs85cUzJ7IQTSR+KLWpgjctHLacF3qSlx
         Ik5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751259770; x=1751864570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k14vHInxFXfvWiA3yiBDXZSY6za1W36jbGVMCLDj9aM=;
        b=o0UM6sMTMohk2KGGBg7wdxefzp+sHzqwTQlNIyftQxw2C869k6whfM4kg/zWEe9kMC
         dU0PXiJwBk0IfCmp54AfFomKBtqXxYagnXITR3W3cKOkDMa78PYS71ZI75MhgVW+aido
         ZLxmyLRIzpM4SkYvbON8glQr3lrKn7/G7n+Md58z28tsqUtYFHEdvtgy2hs//29pHG/C
         xKfQRaiJYKbYpVryWhHgfpAI9/LSSeGIFVWivgdcr4oFeQwUrA3l688MPm99OrJshTkt
         uwdlfUJTBD4fIS1dUm6fxiR42J87GdqI+AWsi2yhWXOEgtgip+5hCunb5rvzplaMisGF
         Zdag==
X-Forwarded-Encrypted: i=1; AJvYcCUJgDzRRT63CVF1NDAnuh0Bp/TJKNT8We9G6EYCGYGyITQFu3G95cxSmxn3qhzswkAdCB5grsjwG5fBKrZP@vger.kernel.org, AJvYcCVVi8p2Bz4EUcPgddkDubzzVvMLlVe0rdPeSFAFhLEtFjunbAlo75jtqp9n38dwdeIhCM5Gb/1NU2I=@vger.kernel.org, AJvYcCWKJkiyGk4vr1aoaj9aePklXL/ucWo19pLOXS9vb3VskTXIahDVRas5ZHJ8dsqrgEAdocCHx/Dg+cU=@vger.kernel.org, AJvYcCXCgex86kRCUlE182BacLliR51XaZU5WfxHmsJGzSXx/2n2z0jETrBGZEmz11aKwGbQoKJpuj9rqIpl@vger.kernel.org, AJvYcCXlIZihNSA+/QVwREhfhuN2lvWKzL2DgN/5xqisQUcHMrDKDIptBWI1uq+ODIQRsnRT+FxESlJWJ3H4aumYcJzFnB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJF34tTWo2B1N8Pkd6e/k2U8nDAUmCEekqKsUju+ntInKxSwa
	zPhPAjDWtYNI+aMkOTJj0UB2oyVt/pli8vr115xFbbRJt5vFeyAtD3F6
X-Gm-Gg: ASbGncufSmskDRwVYIlA/wuYI+gjgD7mGCHPm90rpBirtfKp2gV9hZK6YpvdJklNMMs
	6XRu7Ian3aJzzCRxdke1X9AHuVVVMD0HPG0lZV1vUjzZr3hUi40FwZnnybobTlAhKH4qbGGHm9A
	eZBFs+8oGTMAQZWwpMa0PbHwxbRtUzuP5a8R4muoAG3bOsjH5Y52Vpd7w1boA9c1SAydGRAleyK
	U8yQ4kMkaC1aupilJkdIvMs7AU47SK1fJXrCOb4yDCiCCHpiyBfkBbR+LB/HyntzlwR0ttfXuqX
	Oiy3vNSpFmZbfo3x3fy/BKGLljA2QWf+ms8glBwxVcg2cz8yNq8kHdrBQsRE1YN0mCSJkKbS
X-Google-Smtp-Source: AGHT+IE5SYnmn2DsoXc2OcyiJSIeLfFJprEUGRZPg+PLqeBpDfsjB+lQj9pvXgneyXycHf+dUh7hcA==
X-Received: by 2002:a17:902:e881:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23ac3cf5c12mr163799695ad.21.1751259769921;
        Sun, 29 Jun 2025 22:02:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc4fdsm72602095ad.202.2025.06.29.22.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:02:49 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:02:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	gregkh@linuxfoundation.org, dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	fabrizio.castro.jz@renesas.com, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH v4 1/2] PM: domains: Detach on device_unbind_cleanup()
Message-ID: <f4vj7rab6uftieicz5s3qur7yk26cg3xxaabhcmqnx3nybhshl@j6ahyvw6grik>
References: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
 <20250616135357.3929441-2-claudiu.beznea.uj@bp.renesas.com>
 <CAJZ5v0j_nm_z4ma2AsRkjiZn-AJ2bK982+Mwa8+_PoUAveNATQ@mail.gmail.com>
 <04a6c53c-8383-4496-b502-149bd261cfdb@tuxon.dev>
 <CAJZ5v0gZ3GZ79j2gbhVSjTN+RmYjEUJQjGMSoLsEkUYtjWTngQ@mail.gmail.com>
 <CAPDyKFo5=_eiWBf8fpv6kG8qhM6K3DxnqhttgHHgSTP6CM8LuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFo5=_eiWBf8fpv6kG8qhM6K3DxnqhttgHHgSTP6CM8LuA@mail.gmail.com>

On Thu, Jun 19, 2025 at 02:16:37PM +0200, Ulf Hansson wrote:
> 
> I am not sure it's needed, unless it's especially targeted for the
> ACPI PM domain, which I find hard to believe.
> 
> Also, I find it awkward why the i2c bus should be any different from
> many other types of buses. It's probably just because of legacy and
> that someone took a decision when we added it.

It has nothing to do with I2C and everything to do with ACPI and the
fact that it brings devices into D0 when probing. On ACPI systems
(unlike DT ones) power sequencing is done in firmware so drivers are
unable to control this. And this causes annoying flashing of privacy
leds on webcams.

See details in 1e96078e0ae4 ("at24: Support probing while in non-zero ACPI D state")

If there was a SPI device sharing power rails with a camera we'd need
similar hack in SPI bus.

Thanks.

-- 
Dmitry

