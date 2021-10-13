Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E630542B9E6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 10:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238861AbhJMIKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 04:10:05 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:31491 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238839AbhJMIJ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 04:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634112408;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=SIdqttAv8VY7+GPnyA9vyn4IVdFg1Dkp5cQAN7dWsbA=;
    b=TZU2b0lOnmLfKHi2inaQ528J4Rm8TEj1TfhwkuQBKmTf1uB7NhnT8yTKEsZA2ErZvB
    yPCprch6lE9F1gB27JLaStHAbV340zYe/MRN9wYqvCGgZw+W3qy2R6axfc51pp35dUh1
    WM5njfwXe8B8LKfgXSfWJHEPNAsFtJ4YCoz3+mqe3tdbqPJkcgQpu7urHH3kyjJtSuWL
    J2RjhXdaP9hCqx58oZOyvVERKr3AMANNAqmg0k0B9rJZC6Y45Ot7koo6oFgyrF3obhUk
    +WbO6sr7BoHUznPxjUYK1Nd7yQG554TzF0YWA4PIL9L0/igCESNAbZcZb08pPsx/Pcvy
    akFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgFJ9KSk6V3+Pov4y9Nnu4lP5KR8g=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 AUTH)
    with ESMTPSA id z02498x9D86kgmG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 13 Oct 2021 10:06:46 +0200 (CEST)
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
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
 <YWFqr4uQGlNgnT1z@ninjato> <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Message-ID: <df424385-92af-3fad-f50b-c64897e991e8@xenosoft.de>
Date:   Wed, 13 Oct 2021 10:06:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09 October 2021 at 03:57 pm, Christian Zigotzky wrote:
 > On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
 >>> I still don't have access to any old PASemi hardware but the 
changes from
 >>> v1 are pretty small and I expect them to still work. Would still be 
nice
 >>> if someone with access to such hardware could give this a quick test.
 >> Looks good to me. I will wait a few more days so that people can report
 >> their tests. But it will be in the next merge window.
 >>
 > Series v2:
 >
 > Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]
 >
 > - Christian
 >
 > [1] 
https://forum.hyperion-entertainment.com/viewtopic.php?p=54213#p54213

Series v2:

Tested-by: Damien Stewart (Hypex) [1]

- Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54217#p54217

