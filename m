Return-Path: <linux-i2c+bounces-13246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F9BA5F62
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 14:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8842D1B207D1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A74F29BDA6;
	Sat, 27 Sep 2025 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="aTvKj9Dj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA81A9F92;
	Sat, 27 Sep 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758977835; cv=none; b=hYq7BS5MdscBKtyKAQthOQoAgkOdvm9Sw0YEF/ge7nGVj4tYLc4l4jdC23UG6oKWd2f+N9ERtuEqUMLdrdU6nOKznEQ27HH3UyBAbDhkLOOYKq2JIMRLOG9x+HwcQFU3JAXawYs/zSCa6NgaSY14SbImP+lvrlf9ub8cYYSSyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758977835; c=relaxed/simple;
	bh=ua9gqcKGXFMSOz/BKLfJv9tkJz5FwGFOfoObaXjOa0E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ZJGcXdqpeh72tze+768P1FmQM1biSaAr8FyjolVKHnRMIE8DCFF9mM2Jql3DL662f5CW5umnlycJcwXbjiVRDdWJDXngDr9c/l/EXMq0uOLd3AK/NbAOoWYV8vFwJeZkospbx58jqdpllfesQhfs4qs2orQkZFpRuDlK/r6BOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=aTvKj9Dj; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758977811; x=1759582611; i=markus.elfring@web.de;
	bh=ua9gqcKGXFMSOz/BKLfJv9tkJz5FwGFOfoObaXjOa0E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aTvKj9DjJb40hE2xzGHzAaZYbksMjAdbPVP5I88Oin4XMZdGtsJrZhiVGTAysd45
	 mM+L6IfjW0epb5DckppXy48HUujCSYILTqGJLCsYexdQWS+9KlGg2vFf5XfgRCRTL
	 5TxfgfTVmu/BMXVpxTaEnS8MI3usZRQ3FkWAuelESo6x24C9+Lz7lr/VnTUfW7Z39
	 jetNNyLpj+0NVi9rhbycLHsSB1WjKU1NS4gvmH8ZCbk0iDmWC80kS3pWdvt5pJb+l
	 TKerO3MuS3HXQO+ZM7GvVs7K1Y/lBn5I9Wh0fjb0/RgiPVwMEtoaJ2fpbllhp6qpU
	 xEpsNNse8LOw6zp5Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.221]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcpt-1uoPbs0L8l-00I67D; Sat, 27
 Sep 2025 14:56:51 +0200
Message-ID: <e6703b6c-0ae5-450a-ae3a-1ad899c8f374@web.de>
Date: Sat, 27 Sep 2025 14:56:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linux-i2c@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Elie Morisse <syniurge@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250927105729.19164-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] i2c: fix reference leak in MP2 PCI device
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250927105729.19164-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HyuB8X8e00oKQadKnTraTEpT/f9Oe6aDXV3cLWAI+rSVtYigrj0
 tt0YX1AFhQDKn9P2slqgx+Ql8nhTV0SwwfYzSwP/aYazqfDnv/zu/iD1Zz01GACV3v1yZkl
 56NwJZ3LfUeFJQX6/KILPS8gIfgGrwQcx8djBVhgWo53RaEhq7rhLV96gU9cRJ+PFqebfyK
 IxGPsIknC6EtZonTmnqQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iPbZpDEUEQo=;bpI99+b4xWZJCjpvs+6WW4bo7Ed
 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

> In i2c_amd_probe(), amd_mp2_find_device() utilizes
> driver_find_next_device() which internally calls driver_find_device()
> to locate the matching device. driver_find_device() increments the
> reference count of the found device by calling get_device(), but
> amd_mp2_find_device() fails to call put_device() to decrement the
> reference count before returning. This results in a reference count
> leak of the PCI device each time i2c_amd_probe() is executed, which
> may prevent the device from being properly released and cause a memory
> leak.

How do you think about to increase the application of scope-based resource management?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L1180

Regards,
Markus

