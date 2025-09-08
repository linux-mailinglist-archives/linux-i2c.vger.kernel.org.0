Return-Path: <linux-i2c+bounces-12788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DE1B499BB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 21:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A371B25C18
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 19:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCA9246BCD;
	Mon,  8 Sep 2025 19:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CvUFshts"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009D246BA9;
	Mon,  8 Sep 2025 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359159; cv=none; b=Wqc1nrak05/LFVqSfFNajEAXxEnt1zPvvW/NgOIyFP1pmPgTYw0d12fnL4JVpZgpE5jGNpqmoZ3ONayarO26pLPdv+yYUpXHCavmTZXJxBI/BdVBF1ty6xbRq9JYx09x0HZUGigxxaAl8+x6E39NMZML5RcTB3YGy08CusiIj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359159; c=relaxed/simple;
	bh=ZPdxehxi4vdjvDaMuujnVLi+lluPBIZwX5S26oPcjS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIWl5FMBJEVc98M9qJzm0zJ/aLexaQYo5HYZeJKi+5yGrs18sAXXQxkppF3bJQ1Dzh3lHi9KUgunkoIFWX1gHKHUTGeOpI6QwDwW8kn/fl/Foniw/1UN9MCWz75ZsAxSd35c3p7EUzVV3NcSCnkFwMrnE9d1JDRadHTF9+QeLjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CvUFshts; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757359145; x=1757963945; i=markus.elfring@web.de;
	bh=ZPdxehxi4vdjvDaMuujnVLi+lluPBIZwX5S26oPcjS0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CvUFshtsm2QZ4eynyXig0nOmQaIKUKK/h0SJ51+huivsgoJLqyCdQgYy+cIbNFAw
	 r/rX+zAkY3QueqkE9Tan8mIiFuYiHedw1FBtdJGHmxakPuu/ouCcCp1we6SpEQmNp
	 KX2Vako2uFflaHh8j8BTnxy8e11EXdhi25eRpAHAKOpf6w+CcMDzFN7SdtKna07Q3
	 EOm96bOTDKCSUGQIkEdpZs12WbczLagxjKPYRe8je/77nXoWjkXBUmUa6Nh+ECw58
	 rYDzOTUbDW1tNFt+JATUpxrzzUtwLGVDTeqikkxmKB5piG8zWxjot9aqiptRuaK66
	 o7mlj+Bp7xEif75LKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQgks-1v7Kf83vtu-00Vylb; Mon, 08
 Sep 2025 21:19:04 +0200
Message-ID: <73a19922-bdc9-480c-a373-6984c1a663b7@web.de>
Date: Mon, 8 Sep 2025 21:18:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] i2c: PCF8584: Fix debug macros defines of if
 statements
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
 <20250908175902.214066-1-chiru.cezar.89@gmail.com>
 <20250908175902.214066-2-chiru.cezar.89@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250908175902.214066-2-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kYnzFB3SGpoGcCzOz5850NzM284G902UXm2lqIbMhS+O5XDLmsz
 uCQcDVmj+p/e+YvYznVPUiDJJgHf90MtjvZs4ex9OxEYloCTYzW+OPQNTRpnOJ2AVinHPqB
 g7zTT1je/lvjLbjs3bTKEgurRhtfwsPmpfWwR/NXlTe3qCvG+MpJNdpcFzwnnHDTr5Sp4oK
 vBRJZiBbFbAl1/EKvszXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s/vxiOV30ao=;1cyC62LMEftmwuixoZUNlDdyYFl
 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

> macros: Enclose 'if' statements debug macros defines in do - while loops=
.

Would it be helpful to indicate in each commit message how the change moti=
vation
was influenced by the script =E2=80=9Ccheckpatch.pl=E2=80=9D?

Regards,
Markus

