Return-Path: <linux-i2c+bounces-13264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130CBA6F80
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 13:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FED518999AB
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCA523183B;
	Sun, 28 Sep 2025 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IMCLxH9n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9857C2BB17;
	Sun, 28 Sep 2025 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759057235; cv=none; b=SbbKrNaM0eCgzoOS4INntfUoBNFtI+YUSnODv2MHFGf/E8XfN/QHSK2vNRBbKFEf1hlkHSw9jE6qNtVHEAePvQzCg7bIyHycRwJYZAGJHvpO57EEe53bXFeZl/3QxDNmJazzY7/2Kd/8QAoBoSNa2D4OZ6u/WqCHU8v1CT2lnIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759057235; c=relaxed/simple;
	bh=xEPlcU7ow0LJB+cW6WEw4mjGAw+yb118ABF20JoQCAs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ISeY8megmBm6eit2VjJj/UGiwz60Y9cnlNF/h5HJGbQS/eo44Ps81HBbNXU91mduWhByUPXI0RC++umSVqyVSs6wPT2g/dFgAzfRsYxXumH6vU3NkTVxa0Fd2+sfyg9WqjsOy6Q1DhhaugkfsTUb8SQhcyrmeOYJP2aVdkrgKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IMCLxH9n; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759057215; x=1759662015; i=markus.elfring@web.de;
	bh=xEPlcU7ow0LJB+cW6WEw4mjGAw+yb118ABF20JoQCAs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IMCLxH9nvI+HcEgTeU62pT5qXBHxGspMqbQ7ye0/5INobrNX3b50ybnS8u0L08iQ
	 tjr3ttqx5ClUdg/tE0qDgiPqAUsyJ64RD5JQzRUrJkntwQR4dtXTSFKF7KG07+r+1
	 g6VBrOfaAE0/pJOLqWf9vn7B2bCvKfLw4gd/dOfX9WJWc0iUUJ1GV+yyARtsM84o1
	 V8PB/83AWpz/TlH3X6M5j5w/rbYPFm8RMeB3gjDgXZFaRxjFpC6pwlQFBfZ4rqgJz
	 8bf9ugCZxRUIeYgxHQJ1oETX/dwb/dvp2b66nqj9zOk+EsxDopQyi4ZSBKHkMh0EI
	 DigHAmaYyuhf9eV52A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.189]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxiW-1uaPGJ0yJU-00loFZ; Sun, 28
 Sep 2025 13:00:15 +0200
Message-ID: <0cfce9e4-b84d-41c8-824d-3e1c53d4b6b2@web.de>
Date: Sun, 28 Sep 2025 13:00:13 +0200
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
References: <20250928071933.1627-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v2] i2c: fix reference leak in MP2 PCI device
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250928071933.1627-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wnvXhKZaTYPtYSA63+hp4AyWIc0mIFw+DgA5X8qT4oYoui5cxW9
 aeD8dOiXC9iB+alf1COzLLHU4JsyNx2egjReDhmgtNFLKbG3uhrQIUx6iqe8e+UN0Qg1OR+
 f6kM0szkNe/Ru8Dnv19YgvHFJIHf4jbUK/97ezNI7L+eENxioVONY9oWilDH+TzpyiZ1wdv
 QGlG5Mwx+yZ8a6enQ41zw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ey5SUJnHdwg=;3xS6+Zt6Di5SO8827jJNvm0A6ol
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

Under which circumstances would you become interested to apply an attribut=
e
like =E2=80=9C__free(put_device)=E2=80=9D?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L=
1180

Regards,
Markus

