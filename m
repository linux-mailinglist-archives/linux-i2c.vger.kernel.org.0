Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D3D4289A7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 11:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235503AbhJKJbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 05:31:41 -0400
Received: from marcansoft.com ([212.63.210.85]:33082 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235461AbhJKJbg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 05:31:36 -0400
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Oct 2021 05:31:36 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 162E03FA5E;
        Mon, 11 Oct 2021 09:23:54 +0000 (UTC)
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
To:     Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "R.T.Dickinson" <rtd@a-eon.com>,
        Matthew Leaman <matthew@a-eon.biz>,
        Darren Stevens <darren@stevens-zone.net>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato> <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
 <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
 <YWP71c8cXlE3PcIo@kunai>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <5ae30425-d6d4-5688-36e3-58cc6c6ff264@marcan.st>
Date:   Mon, 11 Oct 2021 18:23:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWP71c8cXlE3PcIo@kunai>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/10/2021 17.54, Wolfram Sang wrote:
>> MAINTAINERS. It'll probably apply cleanly to 5.15-rc5 but if that happens again
> 
> It doesn't because Linus' git doesn't have:
> 
> Documentation/devicetree/bindings/pci/apple,pcie.yaml
> 
> Because MAINTAINER dependencies can be a bit nasty, I suggest I drop the
> MAINTAINER additions for now and we add them later. Then, you can add
> the pasemi-core as well. D'accord?
> 

We can just split the MAINTAINERS changes into a separate patch and I 
can push that one through the SoC tree, along with other MAINTAINERS 
updates. Does that work for everyone?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
