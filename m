Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D4E745A10
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGCKVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 06:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbjGCKVQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 06:21:16 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E794BE;
        Mon,  3 Jul 2023 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=evH9FssxAVDWuosG3wF0geBaPl42ihY9Va8nTcwYQk4=;
        b=XGb6qm4+6EvTbcwEm2H5OprpeV+r77KKVrY7nAOjvIOT6XAUTWG2rnI6S7aAss+aDKsVcta5Z1x
        T4JPgD/zZMhCubNS6zfcPjUbhV9m+Y+zePvqVp27wxzSVkPCZ7z6PiFEMPYCPpa4Z8Yp5p6hAm5Lv
        7kZlteiF0dhw8fWH35EaflvEKAaV2dVQ44ID2GjJIrevdWhYjZEwqm7RwjOr9Wmpt0W9yZbhqgs3C
        aPwatGYlzSkw/yXHA/VZ76jcBPpTPwJknlybrr15ZcJSd1DAUjHJt+rO4qMH98RIhOcujUIj+XtCl
        U+wn/hSIJuwNhEpv7RouKmDQwc8p89Blcigg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qGGgD-000N94-Mb; Mon, 03 Jul 2023 12:21:13 +0200
Received: from [185.17.218.86] (helo=smtpclient.apple)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qGGgD-000Kxt-7r; Mon, 03 Jul 2023 12:21:13 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <ZKKZ4qUw5pKVt1T1@shikoro>
Date:   Mon, 3 Jul 2023 12:21:02 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <48234852-3206-4F73-A7AD-EE6EBE83D774@geanix.com>
References: <20230509132159.4160984-1-sean@geanix.com>
 <ZJV0/cbjn1Qa62u+@shikoro> <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
 <ZKKZ4qUw5pKVt1T1@shikoro>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26958/Mon Jul  3 09:29:03 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On 3 Jul 2023, at 11.50, Wolfram Sang <wsa@kernel.org> wrote:
>=20
>=20
>>> Will DMA actually run in atomic mode?
>=20
>> Atomic is mainly(only) used for writing a single register in the PMIC
>> for the stpmic.
>=20
> And this most probably during shutdown...
>=20
>> Guess that will not trigger any DMA use.
>=20
> ... so I'd be very surprised if DMA is operational that late. I think =
we
> can rule that out independent of I2C messages to be trasnferred.
>=20

Yes, I=E2=80=99ll submit a V2 without the DMA functionality.

/Sean=
