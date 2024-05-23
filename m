Return-Path: <linux-i2c+bounces-3653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBEA8CDA32
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 20:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CD92820EB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 18:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B013839E5;
	Thu, 23 May 2024 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="s1eVKv++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC7762FF;
	Thu, 23 May 2024 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490176; cv=none; b=QDww97ZiH6RxDHZHJnQ39wdk50RVV7tg+gnXi/50nyzUt/wx17c40yHh+frRbqAgy+hXv1ui2OowQd1BFgRBDk7nKRSNW+bLOb0UfYESoeZIQeEVXy1BCiUSmO1ahsget5h7cRou5VxMN4srJg7wbNz/ZQwpmX1g0ePv9zniM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490176; c=relaxed/simple;
	bh=1/DkOOQ4p76I7N1cOX3SyNy1SPrQRKac+fkgkHwVk6M=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WvseADdqDr2CdmgpuNrSDKvZIniusKQ0Eu++ZyXJbakPWfPbrsmWaWNUQ+0TExI86jxnqOsmvQGFSOCNI+mSdwoxaoGaWG8H76tAGrjpSsKxEF0gTc9d68Uy7hcEekktnI/SGIkMzRY/0VrUvBBvbE7XbdfvOORcTCy1u1JbO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=s1eVKv++; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716489931; x=1717094731; i=markus.elfring@web.de;
	bh=1/DkOOQ4p76I7N1cOX3SyNy1SPrQRKac+fkgkHwVk6M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s1eVKv++fc+IwvW54Uw73nfZWda+mNvKUummXp8coUqwW9HDA6CvuZL5IAnNZ+AJ
	 D/1fHo4aRuomZP55p09D/XTF4P8O1uSlPRPcCFXfiFc/D7DDTSvuXtZUdRQWcEU/d
	 S6xzi7iwAL9cK/9jSybRzQ7B/4or2+N2w88SeOU4rTiXcboJNBLpjvefMT0OT475u
	 +YQRGC+HLbLHrqquIFKo/rDH0FYkxq1qA7L2bkh9MqDytIy4RhFkSx/rARwW6y0bj
	 LDb0yqDcYR0z/Pk1ByRUDPZHbRUt3iSsnzR38onSuqBo/ILmSCbp8/DaCbCOpEY8V
	 jGk8mnLSW8uaOKN+hQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1sr0O70paW-00jHkR; Thu, 23
 May 2024 20:45:31 +0200
Message-ID: <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
Date: Thu, 23 May 2024 20:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-18-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FTGLkl+0enI/p1XJo7ZYK9LDrqNcg7b95/RXLCF0nXZ68DUQmlS
 iC7OTWqBrdhVzfK8t14Oai0zRoXTIqXjxUBLL0eq4ajmSllyoBqEhyia4p55PZZJiJEZr9b
 05Py2bbsvv3gqPowLi4lkqommtD0oK3RaiC38w0vQvuWe2qrfZBxVPJ3afDNWacBxveWpyr
 T4QGfXQX8Ybt5JAQobbRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1VX0rS2Imqo=;0iFIBxOIEJruT1gIhSJRlAUIV2o
 tFYgI/LeHVdXNXLpS24mCZL0a+GLOzMLP1NsCnoO507izamlEG9b3D75OJMOA3ZHeAWAEban5
 niWzLmdAA5GQeIyrkeKI3MCisB+uDDMKbLxqTovcD6YI6+jnPh5ZgdfTbte6YZwAnHZrZWsmy
 972frGfk2DJF7Kr9yADERe9ti59Zu+hbb0J4a4h05C5eFahLvbJVQT+oC0jqdLfQZryowssxU
 QNa/MjQQdOqXkX7S4um1Jn/xyK9X5AQtANyGm9Mr+YhZiJ2mfJ9S6fGfU+PPFbqch0JQGIT/d
 XQR957FHDLbcd0gyn2iwi0uAYB2MDBMAJ27/Q9gzMoIVUYouOtU1XpP9tqhnyJdWRi9IKiR2V
 +ANocfPHhJ7CEj4ehQxta/AZZK+NEpbTh2p2IeuIliEwKyJNGsdS/jq98XVKEVy+H0H5c1wyP
 Fe3Ye9vA21R3MemhzSENqAfN6HyHb94oWcrNPviMgUt2EDZ2qX8GV/WXfRHZtZOCQKv00ZEVs
 aeev7JpQyLyi850aQC/t9kKi6RzwRFoM9Mdj3MAZYXoBb5+e7g4EvDJn2U4TNDqgvedn/rLL9
 yPg6sukD554R6FHhNkbXMoZ8KTUj7t49/QAhuBAhHivl3+bV961bacwJmAmmADdkIHaV0nXjn
 lWlgKQNaP4lm0SA5SZS04WP6L3Qz4Wpwuq70ukfdeOOqLIKwmQK/e+YA/1O2NmTtG7azMzp59
 Y8yFCRDTyr7eSWxWpKOHeE1M+M8f/GC1QWYUf7CL5RL0pPMwLCSlzqXxTl7c0QXalNDJ5gQEi
 B/y1EGEUwBLSbTNuEpZbHDRkG+y09LFLmiJDBTvtFahlI=

> The Huygens is a Rainier with modifed FSI wiring.

Will imperative wordings become helpful for a better commit message here?

Regards,
Markus

