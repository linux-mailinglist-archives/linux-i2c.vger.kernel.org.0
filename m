Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515A8427AB7
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 15:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhJIOAn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 10:00:43 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:30965 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhJIOAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Oct 2021 10:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633787850;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
    Subject:Sender;
    bh=CGQhnIEavNCbTVNxzDlkm2hVi0qKWPHcqboBc9funzg=;
    b=GmCi6l4P3bp2z/55flV1Z5xTX/L1TTqRhVc4UMDQ+toy+jpX3YS5Gwl6j4gYhH/fAj
    053sVW+8KXDBfmaHb8AY3tISywsnElewx2kCjDguYl8ZUHcjtJVJLm/LkpNDFhfF6EtJ
    d2KScfIpLPwPtRiXQQj27dij+9Sikue3K17jBDGfwGsXjAYsSdPa1TRqTs6kstg+G3X5
    ny8++OitQ2CbJMXt5GTtxvO2EcMMbeWTlFpvvH04MRxPbIOvaiMGgfnucrk0IGkBEUoK
    FAtiF4UHWb5hHZOVLugPtHNCKP4RSyjscK4CHeFAejYqPh26dEDAB581EpyRk0gyZety
    PRGg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUcg2bZEYgV1fluZdSCNb3F86w"
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex99DvR5Iu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 9 Oct 2021 15:57:27 +0200 (CEST)
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
To:     Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd@a-eon.com>,
        Matthew Leaman <matthew@a-eon.biz>,
        Darren Stevens <darren@stevens-zone.net>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Date:   Sat, 9 Oct 2021 15:57:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWFqr4uQGlNgnT1z@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
>> I still don't have access to any old PASemi hardware but the changes from
>> v1 are pretty small and I expect them to still work. Would still be nice
>> if someone with access to such hardware could give this a quick test.
> Looks good to me. I will wait a few more days so that people can report
> their tests. But it will be in the next merge window.
>
Series v2:

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]

- Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54213#p54213
