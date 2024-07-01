Return-Path: <linux-i2c+bounces-4555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15091E509
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 18:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DEC1F234DB
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8317E16D9B8;
	Mon,  1 Jul 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIvqEQ1a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073916D4FA;
	Mon,  1 Jul 2024 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850452; cv=none; b=mNz+PFDfxUr9dypy4oz8O+PgyfHBXps/DY1B0UTLpyNp1JQ+i7+kcbKQ/UpY0GEEVlHV1PtPXGF0Gqdgl5Q2BbtAxlEoTfb1fCON1Khu0i0OaU8YTkx9njLAoTe2HFiuwJ77thrgbsyW7aobBZZGleW0P+UgZfLcVaItH6/fkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850452; c=relaxed/simple;
	bh=+AQ7sBFYdyhgp+x+WWlZYAcTpu3FvubStwSJ9uOtJNI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Y8eNWLZVsnjKYejV9vcSQLzA0Md+wTaZC8KTgMGi1d+46unJahBosacyZovikb8885aC69J00HGgRxYWFuHnP+jGnChJo5/PfSHY3RR7dWd0GcSnKXpL0bfbvyBZn4Af6mUTb18/3qQ/IdALtkrf74tf7pzWnFn8u+kMeXmMnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIvqEQ1a; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso33616761fa.0;
        Mon, 01 Jul 2024 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850449; x=1720455249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=QIvqEQ1acOGtKggqmvmdr7rehTqevl8Y3IGHCjxtHBRiVnu69KoGPnFgHZMpxru3DI
         k6b2ouFBSCP+KnIU+T1pgtJRvSxY+pyt/dBw3yhHybSMKA9EgTNJ7kC0MsshEK5NdRUU
         FeaTzhBxLz6RdlRbIUu7KwAuo63EOC94k5nncN98x9aO25pdTFxsDkTZCie9pCO28j/Y
         Ikvh5LvHFSwbzQnYlAzHkUNSXua4hkDHM1JgvzZRe1QNHFT8d0cKBnqlPAmRWoGGLv3/
         VXRCOCEZ8VX0BSM1hbN0hk6eDfA9hbMej+Xst3Xaq8rjzfMkyyCuqaBD9jx8rj9jz3VG
         f2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850449; x=1720455249;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=KWCwqbVYlyk+WkCU0BAqGLHLBOPYALCUwTGTIcI1Q51wI4T41rucleM6FLurRNRYKE
         xcGU3WF3EX2G5n1vBneVjZ0svw8yO+IwcjKWi5ytv13VitD0hCsZSZnayMd+FyIEjV68
         2xvkdFKRaxsm1UgK4Ou/0Io5mdDsCOtpHmAEhbXg8wfalmDHAT9MqEQpLbWcry03dX+B
         7k4KIkgrjwnpFTuG1aJlslvNJ1eiR7FPfqg0nJxPnmV88FBcUSswgAnCcHWqr2UDVRkn
         YVEgXkgIcpDgfKVEDmTm8skMD13zCyyc5wBCz46pyrTTrXWiCyy6liQYDsC32D+CU+C8
         t2YA==
X-Forwarded-Encrypted: i=1; AJvYcCV85YK4fNTy/TH3n7w4/d0GQvZwS2Z2/JXfkiFCkCvzrEd4Mrqr9brGTaONhAyV33mrR/2kboQr5dWeQJ44XseJYYBsbh0y5E+ed+UAZVbqcqWC00P5SWLaVREYcSu2VlCn2Zg3qc3msa3rCWeiSso2Db5Ukz4/RlbGBBC8HHfhPatnUeTeWSiP1NURBSZ7VqK3uG3Kow4yDUWnqKB9v7Rdu0ZDJ2JFLRS6oy+h0M5SBSGdkVLZsiwf+XJ0il0OQfTEZ6eI6ck5NVR8iCx/xvHkMDDQNVH3M1B2rsU5Xg8t
X-Gm-Message-State: AOJu0Yx0M9qR+Jhan8JyvZ0ILUw9fzumsgN3orRfENoL/AQ3+b5WNAlC
	Gc0NwzhJdI1eR+J4RRTQ7dWlGW6imCSVHiz3VpCgfWejPaRN6AwE
X-Google-Smtp-Source: AGHT+IHHz/OamA1Ukx5sIFBlK+L0AmnL9jrrDHysPJKMb3Xyg4pOUjtzhB1j4PXHUjwphZM6xFX6sw==
X-Received: by 2002:a2e:8558:0:b0:2ec:5382:2703 with SMTP id 38308e7fff4ca-2ee5e6f6972mr34830361fa.53.1719850448585;
        Mon, 01 Jul 2024 09:14:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.75.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516803aesm14192571fa.79.2024.07.01.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:07 -0700 (PDT)
Subject: Re: [PATCH 2/9] mtd: add mtd_is_master helper
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
Date: Mon, 1 Jul 2024 19:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/1/24 4:53 PM, Marco Felsch wrote:

> Provide a simple helper to make it easy to detect an master mtd device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/linux/mtd/mtd.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 8d10d9d2e830..bf3fc2ea7230 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
>  	return mtd;
>  }
>  
> +static inline bool mtd_is_master(struct mtd_info *mtd)
> +{
> +	return mtd->parent ? false : true;

   Perhaps:

	return !mtd->parent;

[...]

MBR, Sergey

