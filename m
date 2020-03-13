Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14514185099
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 22:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgCMVF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 17:05:26 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:6330 "EHLO
        egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726534AbgCMVF0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 17:05:26 -0400
X-Sender-Id: dreamhost|x-authsender|fuga@studiofuga.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id ACA48920E4B;
        Fri, 13 Mar 2020 20:58:13 +0000 (UTC)
Received: from pdx1-sub0-mail-a25.g.dreamhost.com (100-96-42-19.trex.outbound.svc.cluster.local [100.96.42.19])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 03535920E23;
        Fri, 13 Mar 2020 20:58:13 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|fuga@studiofuga.com
Received: from pdx1-sub0-mail-a25.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Fri, 13 Mar 2020 20:58:13 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|fuga@studiofuga.com
X-MailChannels-Auth-Id: dreamhost
X-Trouble-Turn: 759ed42608d90e84_1584133093442_647394103
X-MC-Loop-Signature: 1584133093442:1780277765
X-MC-Ingress-Time: 1584133093441
Received: from pdx1-sub0-mail-a25.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a25.g.dreamhost.com (Postfix) with ESMTP id 255C5AC605;
        Fri, 13 Mar 2020 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=studiofuga.com; h=
        content-type:mime-version:subject:from:in-reply-to:date:cc
        :content-transfer-encoding:message-id:references:to; s=
        studiofuga.com; bh=ydfbhmckSPSDI5oE8QKXi+Gh/j4=; b=AHOXe4GV4AoZP
        4BMILKPlmuGVPX76t0irsROmfEr4gm4BOjSv1uOowXA/p146mPVTukv+I8RfC/bv
        h9HGFQEDFi5s/7XPdKGvsTtyxPAlSPKbKLW63hYVqIH0uZCVz75OAAoAYgNYa8Lv
        rt+OXhXrw3gOS4BxhkOuv5cQnMxFiY=
Received: from [192.168.178.37] (unknown [151.55.183.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: fuga@studiofuga.com)
        by pdx1-sub0-mail-a25.g.dreamhost.com (Postfix) with ESMTPSA id 15C3CAC623;
        Fri, 13 Mar 2020 13:58:05 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] i2c: mv64xxx: Implement I2C_M_RECV_LEN and
 I2C_FUNC_SMBUS_READ_BLOCK_DATA
X-DH-BACKEND: pdx1-sub0-mail-a25
From:   Federico Fuga <fuga@studiofuga.com>
In-Reply-To: <87k13ox9q1.fsf@FE-laptop>
Date:   Fri, 13 Mar 2020 21:58:03 +0100
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D320E497-D240-4821-99F7-D0BE8744D3EF@studiofuga.com>
References: <20200118115820.9080-1-fuga@studiofuga.com>
 <20200222124805.GJ1716@kunai> <87k13ox9q1.fsf@FE-laptop>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -100
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvjedgudegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtggfuhfgjfffgkfhfvffosehtqhhmtdhhtddvnecuhfhrohhmpefhvgguvghrihgtohcuhfhughgruceofhhughgrsehsthhuughiohhfuhhgrgdrtghomheqnecukfhppeduhedurdehhedrudekfedruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopegludelvddrudeikedrudejkedrfeejngdpihhnvghtpeduhedurdehhedrudekfedruddtkedprhgvthhurhhnqdhprghthhephfgvuggvrhhitghoucfhuhhgrgcuoehfuhhgrgesshhtuhguihhofhhughgrrdgtohhmqedpmhgrihhlfhhrohhmpehfuhhgrgesshhtuhguihhofhhughgrrdgtohhmpdhnrhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all,



> Il giorno 13 mar 2020, alle ore 21:48, Gregory CLEMENT =
<gregory.clement@bootlin.com> ha scritto:
>=20
> Hello Wolfram,
>=20
>> On Sat, Jan 18, 2020 at 12:58:20PM +0100, Federico Fuga wrote:
>>> The i2c_mv64xxx driver doesn't implement the I2C_M_REC_LEN function
>>> essential to allow blocks with variable length to be read from an =
i2c
>>> slave.
>>> This is needed to implement the SMBus Read Block Data function.
>>>=20
>>> This patch implements the function by changing the bytes_left and
>>> msg len on the fly if the flag is specified.
>>>=20
>>> It has been successfully tested on Allwinner A33 with a special
>>> i2c chip that returns variable length blocks on reading.
>>>=20
>>> Signed-off-by: Federico Fuga <fuga@studiofuga.com>
>>> ---
>>=20
>> Gregory, any comment? I can't say much about the implementation. In
>> general, this is a nice feature to have...
>=20
> I thought I was already sent a reviewed by, as I reviewed this patch
> before Frederico actually sent it.
>=20
> So you can even add a
>=20
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>=20
> Thanks,


For what it worth, I can confirm that after many weeks of use the patch =
works as expected without any issue.


Federico





