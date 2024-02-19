Return-Path: <linux-i2c+bounces-1858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E485A2F2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 13:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5311C23649
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 12:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D339F2D605;
	Mon, 19 Feb 2024 12:14:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050982D608;
	Mon, 19 Feb 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708344885; cv=none; b=m6uY379DlD2N4rHkZIjh0XVf//2k4U/Cez1+Uu3pkYOTx3q+2ZT2g+FU7WKNTBJJ9biFSsVEtLXem65snEGOPe/b5cRAfcAp2PAkNwXpKGymE5ajTNiUC9cq1Nlpv9dNnvjiFCNs1rapXuTMcKS77Fjo9kegE1NxnObpS/gM+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708344885; c=relaxed/simple;
	bh=SL7X1GYN5o533vj66r9EvRFsDhwwMDFc5oEtRVzYNBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZovUf5NEznMdlGuSRIGvqdR4zwHPk+nNn7EE4/oHFQAqptfTVhGNk2Hch/8vtfdKrpGiqGGJH3CYt3BABaZffNbZL5q/vu2rJxdYZhWu61y5CR+Qv5G1LlWJch+ANAzoT0m39MF6x46h36HLyC10RyB6bE7vMTXHIJifRCDaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 33CEE61E5FE01;
	Mon, 19 Feb 2024 13:14:16 +0100 (CET)
Message-ID: <a2b5d4f8-ebfe-48d3-af78-8b3a8299925a@molgen.mpg.de>
Date: Mon, 19 Feb 2024 13:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add lis3lv02d for Dell Precision M6800
Content-Language: en-US
To: =?UTF-8?Q?Patrick_H=C3=B6hn?= <hoehnp@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
References: <20240218180400.10413-1-hoehnp@gmx.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240218180400.10413-1-hoehnp@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Patrick,


Thank you very much for sending your first Linux kernel contribution! I 
have some nitpicks, you could address with `git commit --amend`, and 
resend as v2 with `git format-patch -v2 …`.

Linux patches are normally prefixed by the subsystem. `git log --oneline 
drivers/i2c/busses/i2c-i801.c` should give a hint.

Am 18.02.24 um 19:03 schrieb Patrick Höhn:
> Signed-off-by: Patrick Höhn <hoehnp@gmx.de>

I personally prefer elaborate commit messages despite most can be 
deduced from the diff. I also like a description of the test system, in 
case of a laptop the system firmware version you tested with would be 
great to have.

> ---
>   drivers/i2c/busses/i2c-i801.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2c36b36d7d51..ba699db27f58 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1234,6 +1234,7 @@ static const struct {
>   	{ "Vostro V131",        0x1d },
>   	{ "Vostro 5568",        0x29 },
>   	{ "XPS 15 7590",        0x29 },
> +	{ "Precision M6800",    0x29 },

It would be great if you sorted this lexicographically.

>   };
> 
>   static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)

I am looking forward to the updated version. If I can help in any way, 
please don’t hesitate to ask.


Kind regards,

Paul

