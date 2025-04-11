Return-Path: <linux-i2c+bounces-10271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6BA8600D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 16:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638733B4436
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390361F418E;
	Fri, 11 Apr 2025 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM2WS/bn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447631F3FC3;
	Fri, 11 Apr 2025 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380419; cv=none; b=NBK+G1utnDHevkT3/oYkyBEZiZjWcC8H/UIA5XMH00iK6GKPLRqufmbxl5Ej9OSOwhWuqfvcMjNIKul5IILjh3wDewNwPlb51B+C2rRqOIMuHqwS8Ic/ftJp8NgB9ygEAwfUndtcOSqC+Gr11St0qH105V+W0K0fIRdIYvLvHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380419; c=relaxed/simple;
	bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqyQGLdwG0z9f3oBrl+9qpROKOG9uUwNhofACYTVQr94zcjeYz/L1P4v6R9orSQutz4SI3zBsLk1/tZBynJ/xI4b2ajt19Y8y1v3+kqnI0Lm1Uxy0dgYNl0otfbbMUztexNA5GFFVuPbTiWujUprxaoSlVA8Ppd1p6wHVGvcesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM2WS/bn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so3749241a12.2;
        Fri, 11 Apr 2025 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744380415; x=1744985215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=SM2WS/bng0Webpqq68WV7vdAwqPjIPHu7rmH8f3d1Llk9bjRMSCk5T/OWM0rDjqGk2
         6z68Mr5yGBrrkZrW4mu4RQAUtNgo2Ne61BRYWJP6g7dlqpo7VETQozsaWkoFqrz5yNqH
         cSqrl5/5yFtm8GyPgKZVSf0LTRhrn2H3FIuQuxB896PQxdIh4HRJz283+kmrLjp3bJsT
         IlYqVmAC0sQ0ApbSC3ncFiPL++20hp6a5tiRlPUBLdVTIBa/nPZLoPgnq4i/x2ZrQlG+
         LNEsgjnYcHIGuUDdKn78YIx/TsHnPzG1XWLK2/CFHItDLmdYGQ87bIsRElXU92wzx+yo
         Q5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380415; x=1744985215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=ZKGZbuWwsneSeVPRWsfxrIA1stX6fhRL2bW5T3eDBHgKSE/NMRs811jDHlJ9o7wne9
         TnxJVdNws0UaxRMn+HG2JwoIyuCvnWm91Lgi52UTFTebnNosiD1IAN9821ObAVO6lN4S
         1vVeyFetOksHxFTdW5mVn+p1lEIzYD1Uh/P2y0lnjrozQOqgNygZLfn/K6epy2tLJgx9
         nsgnUvOzJW/qjCUQ0MocS2o2UQKj1vGh5DNW2sPUmp8BWWQXyi02TGK/zPMWyk8tUdjQ
         2TVnqnbMymZwT6LUx6Nhq+urb75xIk25hEisbLR/idSM3iwn2GQ8+7oWk5ZcT3hu2upk
         Ro4w==
X-Forwarded-Encrypted: i=1; AJvYcCVfJf7RaPmDMZsW8DVYss6eJTnOi5arTYb/2chrQ3V94uRT3bL25Wmu2ud7EGUhLqSPmusZld/sI3/ZaiYu@vger.kernel.org, AJvYcCXL8NhFxOSHUcc8D4QuRh2WwMkD8vMWPMrvLvDwGIZy6gr4ihYJQC/r7aNYMRT84nrnyI4Wmu1TfkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycW2X1mUnCaMq7m4CeCJjcpFDH4RcppK6CkjCUp/p7zgxggF64
	a083ez0TQRW54zr/z+KVMyxYXHvMkIHWBbbkqg216oK/JHA+Xq0fGfw3tpP+
X-Gm-Gg: ASbGncuZtMXAbqmLnWpOuQwNLP6saHZ/ChpEa5Baf1FOnwU2RiIYdGNVL3PuVzjKMIv
	kj6xB+t9FwQMqnxvlLyLc5JEenTtAsi4MHLrLcohsy9G+eAUXWwraxnM7gAKH9NdpSMRUYj3P1K
	ouusyCCt9sg1kaFRvG/R8glTqidCyk9agM9s7yhp1mNccdi65+aYTjke3ViKqBRN1r7rj79l8HL
	vq8Ouf+0nqXe1ZbD+aejRm//V3A6sfjDZr3MB21Otx3u/1kY14zkgtHDFZLD4s1RBVZZozmaF+p
	MckGWzo8N2onPzwLe+ggsJgnYqaizJC0t1xRrKvNt05QsFFY9YU1cJjYvBsX7I/XJ9BWArVO/G1
	He74WnN/bx+B8Fag0AA==
X-Google-Smtp-Source: AGHT+IE1yOeDj9VvnJ4cJ143MdQvjsuVm7s+alTj6cIAtIkzd0ZDaU4JF1U6ysR5rjPt1629SVONMQ==
X-Received: by 2002:a05:6402:1ecc:b0:5ec:9352:7b20 with SMTP id 4fb4d7f45d1cf-5f36ee45999mr2263715a12.0.1744380415128;
        Fri, 11 Apr 2025 07:06:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:8db5:5583:1b6d:7bba? ([2001:b07:aac:705d:8db5:5583:1b6d:7bba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54fa9sm1005741a12.1.2025.04.11.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:06:54 -0700 (PDT)
Message-ID: <2af51b9c-cde6-4347-b062-daa87bddd8ff@gmail.com>
Date: Fri, 11 Apr 2025 16:06:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
To: Carlos Song <carlos.song@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Francesco Dolcini <francesco@dolcini.it>, Aisheng Dong
 <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2025 13:55, Carlos Song wrote:
>> On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
>>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>>
>>> Rework the read and write code paths in the driver to support
>>> operation in atomic contexts. To achieve this, the driver must not
>>> rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
>>> routine. Even jiffies do not advance in atomic contexts, so timeouts
>>> based on them are substituted with delays.
>>>
>>> Implement atomic, sleep-free, and IRQ-less operation. This increases
>>> complexity but is necessary for atomic I2C transfers required by some
>>> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
>>>
>>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> Any comment on this?
> Looks good. Thank you for your work!
> Do you test it at some board? How can we test simply?

We tested it also by using the xfer_atomic for "normal" transfers
(.master_xfer = lpi2c_imx_xfer_atomic).
The driver is used to drive multiple buses with different devices.

Emanuele


