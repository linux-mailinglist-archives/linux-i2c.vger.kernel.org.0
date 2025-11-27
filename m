Return-Path: <linux-i2c+bounces-14309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7412C8D6D8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62C8334BA8B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B663D31987A;
	Thu, 27 Nov 2025 09:02:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDBE2D948A
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234161; cv=none; b=hEHAuJFV2y3MAMOOxmTjC2ngsmI/SJQxd6xhoZPmfCCic0vaCKQvldoV/N+1HEzZqKnYkIdEfIEVUJD+RazaniZ10Mv7Lwl0lhs3c1R13QG3XrQGtmJO0CmQuEgI/PBwhq437l4tjWincgJwbSRq/JAG3aBaziEqkWQ2h+W5FS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234161; c=relaxed/simple;
	bh=wBnN8Y419gYK57sA8+xqXwDBtmsISzDIBeFML/t6rWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITtRkbj1wRbtt95LzePTNYb6YVtaGptHo4ut/em2zJutmizRotdCZCFATdwDkje8o2nIgxaBT4/fbnzfzhOtpcAjCbIun7rAQ2ANBxkbrSYLp9u75seZHkkzpcQZFPL0HXvBk+8JpCoXU4votZTuOQyYdtlGP7MfTcTANWjs3nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b1dde0961so481668e0c.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234159; x=1764838959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSY12wujyQqkN0s0ZCmyYYswJOo3iF7QtRvGpJcpmMY=;
        b=TJDe6rJa7kT3PRHPKP0T2Vqg3beNMEu2oa6cYNeGXfg/xyyrynLgJukk1NWDj6vPHP
         tdsUKYskUTX7bhm0bFZrRW2sE9wuEJ0OpefRnsQ0fiUl5/3mPO5wlJg4d24RNzAEh0Le
         BaFKSkJVUvxIWjfHzxTyfGULNOqfWZs01FGPxdJ+uhpGF4gI3Bd/qPtTUxr5A+F/lakv
         MCjo1eF9sNGev3jUmfVpbbGmWPiA5qBcB3dJgzHkPcnEEP6q/ApW/U9usC/m8cr+pj2U
         h8+CcXcMCJ+qNDkmPgqXgsI4BdAA2STxkAH0Gx27OhMd0puRG5UoTnwo7L3qZlGXEyvu
         mbEg==
X-Forwarded-Encrypted: i=1; AJvYcCVGtSvyC2BHD8afwDlDNFhIVmC9By2Oso9O9qWkp2obyoTjNx9WoLCqnMd+XyHD+8i4yRwr7oXhdgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWBDcVlFIP7fwSXFg+LIta5OTdUSfj+QWrZdDl+9Bag9Vsfw6
	RgVeJOS/f7ISuIS4k/5mWOg15PwwMSMXtyzFa6T6V2LQYrw27IoJPTO/+qBHJpc3
X-Gm-Gg: ASbGncsfF61AtLgq4AX6XJ9BNtuKCfWCAvi0q8EFfMpEPbnBiAhckfgGi2mM+I3mMvi
	O+WmBZmYUkHS/gHwKUHKZi3rI1wzQyL5GZFnGrSFpNphOi0MdaB8hbxEznTxFJgzCCg4ha+DLkT
	+mG9YrJKFUgd4Z6XlzHGf+fypnIhZ53grsUJhHSWSbrqXIRbITV2WHsRLoq3q6BFCnZOwQZ/YlJ
	NdUoTPlOPktn2HQy4JRQVmjsdZnZTgGINyhW/CooJbdouKAFmcROdcc2UTXJmzmMFsstjucgr42
	Zkxn6dsDIlirGgDnWv954AXflxZfq6ZLeOQnZ0rTeT51n5i3k5YDtpa24FmI7vzrwiOGCcFcDuP
	pgyidyMeiPRDdRpRvVwjGHXll0UaqKv+kwqhcEv9H9zmYpwkHFdpaRClSwZKkfcJ3wNqKOFsRkc
	oDD61IiBc80S+5zOGrxqkeIqdU4X7Ld2sXc0djcjebkY0DctkN
X-Google-Smtp-Source: AGHT+IFOhUAUrfFzXeYRFepZAX8dMCJy4jVTRSb0pUzmRelXW8xVEW+XCtvW8TIRoQK6ZlJML5+hHQ==
X-Received: by 2002:a05:6122:d21:b0:556:9cb9:65cd with SMTP id 71dfb90a1353d-55b8d7283b7mr8902109e0c.6.1764234158643;
        Thu, 27 Nov 2025 01:02:38 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf5141971sm350505e0c.10.2025.11.27.01.02.37
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:02:37 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfd380cd9eso411399137.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmhN9hC6UjxB3ZZ2S6gy1rnVj9OX0m2Kbv5EwsiF3kZ7ZvWzxlDMBwITFBfI8jvepov0F7KVvca6A=@vger.kernel.org
X-Received: by 2002:a67:e108:0:b0:5df:c33d:6e54 with SMTP id
 ada2fe7eead31-5e1de0099d7mr8404976137.3.1764234157141; Thu, 27 Nov 2025
 01:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com> <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 10:02:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
X-Gm-Features: AWmQ_bmLgGar4dfe4FpC2atA-pkz10WbT4MOeIioGse4jPHnHaBNPYet7pQnslE
Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
>
>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

=
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->io))
>                 return PTR_ERR(priv->io);
>
> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);

Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
The former seems to be the least common option.
FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

>         init_waitqueue_head(&priv->wait);
>
>         adap = &priv->adap;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

