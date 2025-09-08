Return-Path: <linux-i2c+bounces-12783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D307B49689
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 19:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4641B2833C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 17:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C278831196C;
	Mon,  8 Sep 2025 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UPmZWq+M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4293101DC;
	Mon,  8 Sep 2025 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351332; cv=none; b=VKjM93xnZqC8zKNwOajZ7pmJ/6gUDyHDpD/oak3g/NNocvd92Q14WkdYLwMPkLbqDUlliUNlTZoqk/TWMdwa/tK0bQdvS56jCm6ft5+HwvStJJHvh1voXH+LX1i6H/Z+njnCE0Gxa+1oB0erYIzZBiTjpl/Vf+ZlcCxSuKI2Flo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351332; c=relaxed/simple;
	bh=aSHJOGuAmbu4jRG6nN6m9ehXoLMuRO6BKf+oUMsgf0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgjiArV3a4F0CbzoLbfOdNUvpO58TqoQMPMaenUlBc4j8lg+uebg/57GrmOKYhqA6SXSqYDQNzLV0998JYBi2foQ1oWTIaQE8fJ/+7SQKXudvYG+zakFu+t8u1cl5Yaaie72tmumM8neSNM+0emnlNtPlpz/VM6b6umRmaRGC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UPmZWq+M; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757351322; x=1757956122; i=markus.elfring@web.de;
	bh=aSHJOGuAmbu4jRG6nN6m9ehXoLMuRO6BKf+oUMsgf0U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UPmZWq+M3SzHi3Fdu70tZu1oySmjMZ+MDMCWRx2S0YW6KoQTw+py5U5JnODoRHPL
	 LFKmWX460LhzLBCoUqPP41Sl5+pOgBvwl6+pUkYRKts/zxTUrLEshO1yv/R2nkPJJ
	 Lw+XmkvHjaWpGTSnpp7vry6rsXcReOUIvD9CcV9jRt+19u+qYWX54XpxiDRve0SCU
	 m022F/2J4KkNyo24Zg69uEDvALUf/6bEyOffoqADyK5amnpgU+8wai6bYUZhpXJ4Z
	 M7DLgZSXyWqyweGorMye+ouh1NhrFfKHuNle+MsCCaweoyEJ3IRYXkHOZwKw4nJm4
	 uY6jU2rHgBB8fVqMUQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.229]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d7s-1uTIe20CNc-015H1Q; Mon, 08
 Sep 2025 19:08:42 +0200
Message-ID: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
Date: Mon, 8 Sep 2025 19:08:41 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 1/3] i2c: PCF8584: Fix debug macros defines of if statements
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
 <20250908133608.45773-1-chiru.cezar.89@gmail.com>
 <20250908133608.45773-2-chiru.cezar.89@gmail.com>
 <8c23242e-348f-467b-adc1-deae06e7ea09@web.de> <aL75U7i7lyMfaupK@hangmanPC>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aL75U7i7lyMfaupK@hangmanPC>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:S1MwUj1RJSKbdj2Yd8sZHNZOjq3Q42lZQu5WjmkcKTWVlWgBMS4
 38p6xjhiNscFOTc8OdCXXLduM1AddVFFIYrhTgawVod3uwOC16Do2uaVsGgCN369KGj5vdD
 QUJT/4NyMmHTuXjCAWNk6L22+0gzrHu3JbEd+AO9WBCXkxTmD5Pl/JMs6blFtbGkD4cDwnM
 FQNt3SqGXkg3JHymewNCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HJfEeRCjBAg=;Kt5cRwtYBJnZ1+JwrTjG9ITxFsO
 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
 jG+g==

> Sorry, I didn't understood the first time. I will try my best.

Would you get further development inspirations from previously published information?

Regards,
Markus

