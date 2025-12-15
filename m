Return-Path: <linux-i2c+bounces-14565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E2CBFFEB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 22:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FAA23029C57
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 21:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC046329C61;
	Mon, 15 Dec 2025 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YNSd0XPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9B26299
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765834684; cv=none; b=Lmq3g2t5NJJ4++SfeIeZW6u7JztK7csi1fEHY3b8Qv4dibVY2+Vzx/b8LPdvHpNtrHjMr70pmZ2+HRdbJLQ5WmnnYaKNl8zUbYGeu48XuWl5Sl3l2Lq42lG2FkSQFsQa2pnbblxh/P47wD8A9xWSsIrdeCz8ht37ZOMHdI4FVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765834684; c=relaxed/simple;
	bh=lQRPuDINrKcEybKINcje3EVQa/wcgXqMSsP7lzTu2AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeLl7FUqTXlfPo63VU0W7PW8QN/EN3/rxlYfyy0p5WUVpHiiqnfNTsURqH9pbjCXm4V04bEoUd3X/jAruLVc/U/vNU01twtZLX/DpdI4pKm7VfV1goqzJ1ju0aoVFxF38UbKTi7/lJwrx1ZyyN2R2I8sEcwIcF6BHX/TlpIjMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YNSd0XPV; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-3f16015f484so1868105fac.1
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 13:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765834681; x=1766439481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDtbqIG7+Eh3r+44039T7Pz3MN5wwnQSOfutcxi0ME8=;
        b=qHBLpVWG7JZpXLfkQCd2WGM3bXu4yGi6P8X+wpLRaQ4p7tuzRkB8CeklxxGfac4NJA
         9T7c4Ud/7YcRWhoFfURruH3uI69Oj+sDgsBHvPFybVbUxK49ciJ1PdFpl5mcjv23YSQD
         3Fmw62Dj6nn+qAeKJKJQH/QuOHsoTEcXr7qDBhWfis5AfDVPYXqZT1ImdOo7Qe2fqFdC
         7rg3tAaRo4JtxxUNl+hh/yf2OQX2ZAOu3FCU1/4fETDeOLHB5lhYJOapBV0HZ3H3iDyh
         iUgtc8e5OH6nK6WPe5gqFAlQ6kDV8deHU7SeMjZ2/i17Z7i8b8mOaSMgE2YMjt+HnhXz
         gmNA==
X-Gm-Message-State: AOJu0YzMB+kZPtcVkFRg2SJSOIJlCQ6C/SsJ+rZQzkA3WyAVZ+ZSfoPj
	VUFeEtlI4ZvMgB20k5zS44YfFN3vl7AstaCTWwrNG1qIPFHvKFDYY2lFrXJYu6gCCoRrVF/0pqh
	08R9N+PsM+a/UIel/5j6ga3M3NmtuMG7R3SV6qadq6A48Hqc92PrYC1Naq4i7HYTkbQs9MxoE24
	wNRPni8Zfu5/pC+1ytLtrpynMhzMe/qqohO9Ef5u6tVvVrTcANgWLnnAnOT8pVwDvGqClnU7QU4
	nDs6Aa+8JVl/YCazTKU
X-Gm-Gg: AY/fxX61YDN2o0ln2zHfACUexLHaQHTBYIcq0uLQTJo0N8byXekNv1fJrPSei7wLePC
	sfnuzxMCOLgpP6PPwHqdFBEF6naNinB+EBOwdaQNJG3Db/Dvc+S9JdY9XpkEF2sk1Q8EbrqJUtM
	0Fm/s/GH6ZowK3z62rKjzdODjJHUw8oP1bXSTR6VzRBaEBvEbFkiE2cQPjDXUkay5H8ZYossFYl
	30Ig9HUQwzpk/go14q6yqTRaBxza9U1T2J653LbKuoq0s8Al/hfgBbU9LFOPdpmBmmf+EEg7jZQ
	ThkEhQgN3slfl8j5ahQqfmAodlpwhF3IAiO/o4mVGPS9t+Xpau1DYLBX5L4VvXG1eXl6h3xWsE+
	1WGyzv/LKiAzbDVab3CdcBHPEmohfll836V/K1/Xeyenyofdfsss/WOPQaDJ39zM9/NtF4gEoG8
	CikFjyFtJ3jB6AV9ditW3ahivcsi4ebjDATN7WGlnVnhmE1MjEcQ==
X-Google-Smtp-Source: AGHT+IEN5QEFsePsIwE3ZaK7VU7ueqQye48RBYAC2Vu2mwNDIAEVCmidm/NzruwP7J8jU8miDlox+/hZhrHK
X-Received: by 2002:a05:6870:d8ce:b0:3ec:7947:33ac with SMTP id 586e51a60fabf-3f5f975c1cemr6959075fac.16.1765834681505;
        Mon, 15 Dec 2025 13:38:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-3f614e7e074sm1087596fac.17.2025.12.15.13.38.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:38:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so81991091cf.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765834681; x=1766439481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WDtbqIG7+Eh3r+44039T7Pz3MN5wwnQSOfutcxi0ME8=;
        b=YNSd0XPVnbhC0VFfSVcCv5TlaNqMUn1dN3/jc+/UNDCi22gP422VKOF+808KdnuvWA
         lNd8gZ1Xbn9fmmzMwID2cD77gf6x0AzE3+gRt0Q3WeY0HZBZOT+mCtIX+m2s2TlgVI3f
         uGyEIbHY/ktZ5WwfvjF1FAWhSZ8cI/uT/GSaY=
X-Received: by 2002:ac8:5a0b:0:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f1bfb9d159mr211751921cf.5.1765834680667;
        Mon, 15 Dec 2025 13:38:00 -0800 (PST)
X-Received: by 2002:ac8:5a0b:0:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f1bfb9d159mr211751661cf.5.1765834680115;
        Mon, 15 Dec 2025 13:38:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a85eaac7sm58926146d6.45.2025.12.15.13.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:37:59 -0800 (PST)
Message-ID: <ddbf78c7-539c-42d9-b3dc-0d51ab52e2d2@broadcom.com>
Date: Mon, 15 Dec 2025 13:37:57 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for
 brcm,iproc-nic-i2c
To: "Rob Herring (Arm)" <robh@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212805.3322218-1-robh@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20251215212805.3322218-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 12/15/25 13:28, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> The brcm,iproc-nic-i2c variant has 2 reg entries.
> 
> The second one is related to the brcm,ape-hsls-addr-mask property, but it's
> not clear what a proper description would be.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

