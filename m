Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7C241905B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 10:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhI0IF1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 04:05:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34735 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbhI0IF1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 04:05:27 -0400
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Sep 2021 04:05:26 EDT
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHw4L48sPz4xbQ;
        Mon, 27 Sep 2021 17:58:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1632729514;
        bh=E4BdjuVETK7euJtsU6o5OD1pMsd5uiT5C7A+uie8WFk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=W7rpJofgDBEYaP+1zJGCdVI3wAm69ZkvJEk2KKHvxhD9+4oUEKLMFttM7ARh+kukC
         59GMnNOKcnBYNDMwNPPNu6svOTrd5BZYIQHNwO/WF5vsjt8YhcJDi5XTw6BlQuOuoK
         Xt+faEsSD/PcD6855I1e64lfION8fCvEIC/64XGRgWE++SIMSl2ccsnjEZf/17lUkq
         XbPUkkAgEWthTz/dW+9HlcXvAPV90tmLhxYvDPDcBOXEpgVOVkyT4fAwKpJlR+tAZ3
         IdIWUpuLeiX9U0dsGB6EPhJBtuFcEjLU11jQhpafaQVGZCP+8iOJhvMZsZiXjJIQdK
         T/OuEOSFokLWw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>
Cc:     Christian Zigotzky <chzigotzky@xenosoft.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
In-Reply-To: <YVFtrpxfUbzv4XxT@shikoro>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <YVFtrpxfUbzv4XxT@shikoro>
Date:   Mon, 27 Sep 2021 17:58:25 +1000
Message-ID: <87mtnylaam.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@kernel.org> writes:
>> Sure, will do that later as well!
>
> But please do it privately. For upstreaming, the patch series you sent
> is way better than a single patch.

Christian, the whole series is downloadable as a single mbox here:

https://patchwork.ozlabs.org/series/264134/mbox/

Save that to a file and apply with `git am`.

eg:

 $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
 $ git am mbox

It applies cleanly on v5.15-rc3.

cheers
