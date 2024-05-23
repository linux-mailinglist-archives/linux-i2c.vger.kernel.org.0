Return-Path: <linux-i2c+bounces-3652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A48CD7D5
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 17:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BEBC2832EB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 15:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0BC14A85;
	Thu, 23 May 2024 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AvAAI6Ka"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DE12E55;
	Thu, 23 May 2024 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479745; cv=none; b=EZDf1NHEC1ljfMxDSnQ2SwbBsq2rgf/23jgUWdzYJYO7Z32ujOOS0WKbOnYVtN/WvThrYj6r0pKfFZgbPGDtFgfg9q6OOHOyuUvR/4F9/Q/PJmomB0Nw2o0dxi9yYHCUtffxMDSPWkzIpwd9Lmlzt1WoLVgRuzTJaIvtNK9sT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479745; c=relaxed/simple;
	bh=TIMNJk57A3yArfkP5l/Y5yU0QttkwhGd1NhmgzcFI2o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uI75QZ7IEyG+WUMnwh28Tj3+EIeJjAaWPol84BMY73k27FYNFMRd2aFym1BiB6ZKMFQCCGtdEy8u7XmmnQDcQcpxbCZ/M9+3lpeZdSyse+LewGCj71QX4XdD/PAmlTY0qSjRWQUH1PW6dswsKv4+3aDa38AO/QVu0zwEzOEqMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AvAAI6Ka; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716479721; x=1717084521; i=markus.elfring@web.de;
	bh=TIMNJk57A3yArfkP5l/Y5yU0QttkwhGd1NhmgzcFI2o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AvAAI6Ka4N7YFLX0MPVtAicws2w/QAs75oJnQdVN12zS1qZEAhhaA/nnt28hYuXk
	 a3OSzrhxae97ysBkSuvvSDDj32SC+15BjPm5790DSrMXQZU/CNhS/trt01eBTuwTW
	 IcMov35Hg5yy/8QKTGaOjx1FZxrhOjfHZwPVFx6T5gyPU2L4Q8H6Xhek54v+hSpce
	 2G67Ccf2iggw9pnyR1v8c3t1UxgL8v4a7cdO+4lvE7j7wMQG6wEFFFv6zkKnBtT73
	 tGZw46TIgpsqfLzdtyjZgEPuHhTeM7zptoHnSUME7d3PKO6aiAo1wF0pHvT+ujTJr
	 QCpK2ERoew70BcxYdg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N01ds-1sUbHz2lsM-00x3aZ; Thu, 23
 May 2024 17:55:21 +0200
Message-ID: <05b7feb3-8184-43c3-a4c8-fd30f13a5bab@web.de>
Date: Thu, 23 May 2024 17:55:19 +0200
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
 kernel-janitors@vger.kernel.org, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Conor Dooley <conor.dooley@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-6-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 05/20] dt-bindings: fsi: Document the IBM SBEFIFO
 engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-6-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JKuuEv/GLKvsh8G4/NwfhilnBuQyABiO/YwRlE1q/KxZRSNL2pL
 M1xrX0qbHL0raBK1u4y7Z1NnJ/n3Dtqj578oar2HYQwKTi8ydNWeVeOlIb6gtos9vg0914n
 f25Wu3KQn0DJRIJQ1YpHug4CVfLb+SbRHfIal9zgcFEh/x3b0VgGrF6+RxGXOBmVEtowFvi
 Ku0qRv6iHzmWMg/5z23wA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Th7Bo8htPYk=;SvhlPm571o5u3zKwYGIfflRrhE8
 xpsFGkgYOMd9Cyux9u2x1isOABxvKR9q38ig0PF41M6Lj8pODm/oLBX/F52hGE8ZQK0qpLTEa
 z/hGEmvaQmK0ArG5iEy+rNRUDCDnLGmFyP4uXvmLYXn7fhhgOsSCa4UTs+siVzdfmUzXRyknI
 fydS45RA+7Z7TePx3LA9m/dqERpCTrFbdwj6ato3EoYygpYYXDTunLRcPfBg3pATcWxOK8PqO
 8h3bEGmSizbwdGvF++6VAf7M/ZBJjUAon8cDO8BdF/IaLRgP6twu/uU1dfRluEY5CP1Q9/BQf
 fuG+Jvpoc92vJqD/plwFt7zdqogLLtoXXvIwvRuD3NQ4aK2rTY9SX4fFgYEgg6tTA9BQjGgO7
 vT+ckHw/GwgxpWcIomZaHw+IIsjFkdwDc6ZBq4ht/8oXLkuJT1h3u6E6+FjgE88AQeyAra9Eu
 x3l97o4jcMRxv4EcNHc61gJ/DZOFeLhy7wjKamh6eu2K6Nm8wVdYy6tV2Js9VAS0g2aYtwzXo
 2Ft9AnuYEzLVuL3OMkVOqvwmbpk5/jvhYaUaLJpIFSKwTLKlqtH8KbtlWujb0fWpLQUpP29v0
 hIMzXWnNoIzep2SGwsEahn1w//tAshGv55IIVOWozrzpwiO0aBurCqArDVPeXV+7D66x9oKky
 H7CKmB9vxWjisSHKZAhcoIrTqNcvwhB+p6Xvrd1/wx8XrkBo0835ldT5eKbqvRFgcWRqnFrvi
 zy1nGzZjBN+H/jt17PQ+asfj7gKud12T9EvZn1ccMEB44Pg8U/rfOS/V8MdEReuOMpTgf7UU5
 k1ywHlitSrGvFDh33uXRifu5Yb4IWa19Y6+S4nty3SW28=

> The SBEFIFO engine provides an interface to the POWER processor
> Self Boot Engine (SBE).

Under which circumstances will imperative wordings be applied for
another improved change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94

Regards,
Markus

