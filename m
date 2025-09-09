Return-Path: <linux-i2c+bounces-12795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E5B4A38A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 09:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE9A3A6ACF
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 07:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6283074A0;
	Tue,  9 Sep 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PNn/FiRs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF1307AE1;
	Tue,  9 Sep 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403015; cv=none; b=ZW6i5RRpET3/sx9HOYiSwPmigeo4+iySSo6ibghAxzZvHprvCkG8J+ljIC8NMJo8zhnacnyFc1B0yEKfK5hKxvP01QEMNnoa3/w54UyrK/jArlKsUVoIjfBTZ0ECfg1NJqHBGOUVgPTkDYtfkMSUGhdGbTlyRYn7H9P7GlaKef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403015; c=relaxed/simple;
	bh=17TjPEGleH6jkUH/eop+H4Y2Hc+UAEPRsawJCtI45zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP5s1l7x2kA3NfIDYOSCG3WlUypOHksy9tvidKqkY7KsGknfiqlpm9NkFp0/9ErW4uhS15m7LW+v9klMXoH816L2WPlH+SipoQhc0vBdIS1N3NRWOVIVMB2fohK+n/blUgmypq2XILtW92Ibalh/N/JbsfJrsMb0a7uNlqXrVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PNn/FiRs; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757403006; x=1758007806; i=markus.elfring@web.de;
	bh=17TjPEGleH6jkUH/eop+H4Y2Hc+UAEPRsawJCtI45zE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PNn/FiRsXHec54fw0ClKI4eVek2u5cIYnr/9Wu95+T4s+5H4mXQ+LAFC3dwcENbh
	 dJxeGlgrD2SJTOVzLRB3sR0mowG3lVQYxYMYgkaSQ2HT8PTr2PPTzHia8ZnO8bylQ
	 VORDUHHe2INC9atE2ms4JJXQQDQr0u49WZsZV8ZMMBBzRYVBBwJcT611Y3SZNLNLF
	 3mWQUfYPEHInGjofggbZPkt6qU6tkdaUbURCTeoYY8BVyVaCOYmwDX1O+mt+H6DRa
	 wwXAGoa4LsVk3BGK855SQRJPY5AaR0MdkNmX3y1LTJAixKrPZL8BlYuZprwkYq1UU
	 Ubg9xwgkvzHqhuPeWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.239]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mhnvw-1uI8CM1eOe-00n5r9; Tue, 09
 Sep 2025 09:30:06 +0200
Message-ID: <d81c00f2-8b77-4b5d-baf7-afcc7dc5ac9b@web.de>
Date: Tue, 9 Sep 2025 09:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: PCF8584: Fix space(s) required before or
 after different operators
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
 <20250908175902.214066-1-chiru.cezar.89@gmail.com>
 <20250908175902.214066-4-chiru.cezar.89@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250908175902.214066-4-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:l/fJlVBUoECITIEhU/X4kmvf1OlJLNMoR5VvSDUb5ICkKbuxa0+
 Drwd3xMwKPNhaXVmS9xjZ/01+p5ao7SOCWxBWCpRSV6zIlkUc2TfO0Eq+wiA+CWAAZuCL0a
 Rv/x+asGS4XN7gXXvubCu/1jY11odvdvJOD3tFOWH0iOGFelP5n7cDGYnBL83xdX3oVCPq3
 fy24h4oWqf4S//vTZ6DCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v50c91MgUao=;PLa/zQN4OpiXBrY3ufg8et5Ca7u
 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

> operators: Require spaces around or before or after '=', ';', '<' and ','.
> Add space(s) around or before or after different operators.

How do you think about to refine such a wording approach another bit?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.17-rc5#n274
https://elixir.bootlin.com/linux/v6.17-rc5/source/scripts/checkpatch.pl#L5090-L5399

Regards,
Markus

