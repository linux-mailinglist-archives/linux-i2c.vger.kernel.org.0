Return-Path: <linux-i2c+bounces-8337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A675A9E44C6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 20:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5B59B3CC0B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DB71C3BFB;
	Wed,  4 Dec 2024 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LxRDAdf+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206961C3BEA
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 19:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733338877; cv=none; b=cutM/XksGML5A0d/OxF/+jIb/c4+UhpGrMNhOu1ZvdtI7ZldHkHstpWTaE/m34pG1ormq0ob9VXw82eC9+OUrWshoIhsMLWkPMklAzbWMHy6nhI7dS05LSiCWUbUazt7CBzkTuwgkH7JdYVijBxP9UdOtBQJDOEmkciG9lEDK6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733338877; c=relaxed/simple;
	bh=dGMgCWy/FiSkAdMp9UvdT741buU8HdpvqsGF6tj+vB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omn85gkX0w3nyr1kBdT989DOvek9vwg4v4xCsDhfFQjmMZTHYsgsFdx7udneIOenuYPiVwFpNW2I2y+viMmllcPOhzLNpODTm/xC9mM+rWv9LOTMoGxjWMn1uEUYQ6x8B8h2DXliA8G6/ldU0eGN2YkPJzWFk6vtlIlmPzqHMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LxRDAdf+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21572ca3cccso620325ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733338875; x=1733943675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XYJicyJQPAVSX/dBdv1LhzFxvGUg1nM0XwsK+pFCmjQ=;
        b=LxRDAdf+1DwFC7+7OCZbeC8YeWu57C5qeiACTR1rQwKS0Q7NYPXYGZjQ/o5l9dZgZR
         6wXyKrlVwjJ5Z0Jh2Tq/SWp8YwbEs22rw3QbC7ORmR5pqRTBh/qWvDzQNmxbn7TD5eCm
         81nnx5DXNMd469igADCgyXg8+SVX5K66sUcN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733338875; x=1733943675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYJicyJQPAVSX/dBdv1LhzFxvGUg1nM0XwsK+pFCmjQ=;
        b=prA9CQ+tgJeljPzuVCUjRroILcuxqc8iD8PwxgO4l+3LiHWrcPnir7aYtXBnsDIYu0
         7VxSb3siR5KPz19hpPVy5DySW9N2V0JEFLykeVIoAzgenxyiPZmlAdpN0NmTI3lO67P0
         zQ2cVuVigcwmXoNS1Pj3UQN8Xqla2/G9YgMdvuq9ejwO0RVxATzUzzKOFDM2MuMFvTW3
         FooQdTjgfOVWTO+TzjktWvrCzLXQSSQCRhX32Vwg2U/5xMAgPDsFwWRGzBeOCU+2vXaQ
         j6BPYUXLoeyCp5bKGMWT4f0HpDidjY4N/x5M01vACD49FVXzvCqNnEO9XPm32ZLwIWHY
         sCsQ==
X-Gm-Message-State: AOJu0YxKHnySL7iU1Uzx67+SL65bgoxgdh4RroT4hntg+zuyKGvo2vjj
	92hQOPZ6tiuXDlKrAvEIeuK2NTuMVQ1qhrU+PLSycMZlonT0zlMOeJgCyRGihpwlNf3M8lDHWfk
	zjw==
X-Gm-Gg: ASbGnctPCfFMdp16dDMQnMzYv0mqGswkFAWtPVrMhoaBSpFEfqMRixiBLhLkyDK7awh
	fR3HuE3fRhfMiUBGdVJLkNrZxF6pwktWC41gYzquipmVaZW7NCF2kN/dYwzaK49MgzIPEvJ1HvJ
	w6JA0QGKri7WxbO6rQIJmISh5TydUFeXY6OhRblJajSTspaNjYZdToIREHuFg919WMpwRjalmrp
	LXp8EMyxgJyKlFyosP+CI+a6ZJKkCPRMg27NIz9vHaiN3L+XhLcL0884oRLA0Row2uXytJWt9cf
	0UV0KtgK/gF/aA==
X-Google-Smtp-Source: AGHT+IFx2UQX3Qw+wx2n9U/LxHVb25NkWhzrS7DgmJE1ZbsrB31Xb7ZyILPG5QkvWqZrajsrH/wjwg==
X-Received: by 2002:a17:902:da81:b0:215:5d43:6f0e with SMTP id d9443c01a7336-215bd24af1cmr94175695ad.41.1733338875373;
        Wed, 04 Dec 2024 11:01:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154e33e424sm89293845ad.144.2024.12.04.11.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 11:01:14 -0800 (PST)
Message-ID: <34d5854e-0686-4ddf-bbfe-92f2bafa782e@broadcom.com>
Date: Wed, 4 Dec 2024 11:01:12 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: I2C_BRCMSTB should not default to y when
 compile-testing
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andi Shyti <andi.shyti@kernel.org>, Anand Gore <anand.gore@broadcom.com>,
 Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, William Zhang <william.zhang@broadcom.com>
Cc: linux-i2c@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <36b2923241f285595f43bb9565da352fd366c63e.1733242595.git.geert+renesas@glider.be>
Content-Language: en-US
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
In-Reply-To: <36b2923241f285595f43bb9565da352fd366c63e.1733242595.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 08:19, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

