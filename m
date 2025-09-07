Return-Path: <linux-i2c+bounces-12718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A049B47C9F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 19:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE947169896
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 17:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5028C2882D0;
	Sun,  7 Sep 2025 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TfLOItid"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22625C81E;
	Sun,  7 Sep 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757267112; cv=none; b=cMDoNrLhiP6zb5Uv1EQzerwASyrDonk2XJyhskh76TxSW8r9sSXy542C3dpqdToUJJjTW1ZBr+lE85m4V7+v5GOLEoSDrHIWl92By3OOpPp69lIYRBzNsUorY898XHvFOxaBNeq3xj1CFkX4DmKNoW+PjZQdBMN/LPh33kvy38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757267112; c=relaxed/simple;
	bh=aCfplkmNEKo9ZJ+M48D5A+6Eg+CtJkaPixrZDjOAv/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCT0rRT1nrtuHYGm2A0Vg3gt29T/INNSsW0+MpheqddY5Gyzx/7fjYrUb6B7E1ZQNZfGd0tOXgY8URBEnaanCWiqk4IBPI/N6wMp4jSTReAaFZWTj7KFQZ/tyvLnutGgXzRIk3rkcL0uvM08YEO3+LSqB2NZ7dfibgLSRXg0dbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TfLOItid; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757267103; x=1757871903; i=markus.elfring@web.de;
	bh=aCfplkmNEKo9ZJ+M48D5A+6Eg+CtJkaPixrZDjOAv/g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TfLOItid3leDpxBhVXZMUhz5ak5FlqSZtHHAztlEGKAb494HEtzswIeapBQAhuRA
	 oMxa39Zkb2pKgqE9xv0qX9PW4oARc6Mr11SFbm1dM4A1UKt2MIjxjpwKugPkCGVn6
	 UR6mjLhs480kpGO+Uk1YXcQDS/srrZ+zuyDVM4RuGv5x6IQhCk4z7pBkaZ+4zh/6O
	 Eof48ol438/MCId8afSHwAB7cj6tAmXm3/O4zyGtQSqczP0e4sHZ7uHSqFiyUgSD5
	 9+Uvwrkty6NwpiXJpSwW3+xNOg0HHepbTO1xHTQNvJmRPf/p0hjS2FBA6q0tBXA+w
	 Mij9zY3oCxe6VHzAkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.176]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6HKG-1uojrj0fxg-001Bvz; Sun, 07
 Sep 2025 19:45:03 +0200
Message-ID: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
Date: Sun, 7 Sep 2025 19:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c : algos : i2c-algo-pcf.c : fixed errors shown by
 checkpatch
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20250907120706.44114-1-chiru.cezar.89@gmail.com>
 <dcadf502-8c14-46fe-8e2f-222cdec4dae4@web.de> <aL2nBBmyQ-gks8Q3@hangmanPC>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aL2nBBmyQ-gks8Q3@hangmanPC>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NR2IXJdX0/lLgWtOMtGHJejqQg3pG0TgXGiR9QYSV3+fG3fIWOp
 Cpe/yHFziGsnosZmIAEeUMlU6nqF7g7EHf/7PbtHIDu0+HoK3EBqm4BhB+CToZK0TczWrGH
 z7NxqqY5HvfptlQpxWm7W4c2Qs2GEHELOa+Aoj2mvK5QutwUrcb9j9LK8ApBrX5wzK2Xmgm
 M/YTUZgZGk8PPtix/50eg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DnDOnimukAs=;xXVDhxlxhUUXRH6DtTFtzTxnQyl
 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
 4fHFIiVWWrlGoybzOLp

>> See also:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n81
> Refactored the commit message to be more compact

Would you get into the mood to contribute another improved patch series?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n168


> Markus, Andi, new [PATCH v3] attached to this email.

Please take another look at the usual development message requirements.

Regards,
Markus

