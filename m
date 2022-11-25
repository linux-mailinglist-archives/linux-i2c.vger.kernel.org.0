Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0242463879F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 11:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiKYKgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 05:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiKYKgC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 05:36:02 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57032303CB;
        Fri, 25 Nov 2022 02:36:01 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C2D385C0090;
        Fri, 25 Nov 2022 05:36:00 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 25 Nov 2022 05:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1669372560; x=1669458960; bh=VNwX2vXO61
        X0uYZ41E6oKqEzDNGY/LfLxq0bY0q1V4o=; b=k/y3tX8KQIuf//qmBlq1s2A8yk
        uv3FlHQXvDso9xMfv5RvYDUgaySKYjD+dPwas2LBM1n4ToppYai9cZ0iEKJAcqSs
        HOqpemBD/vSbKHqFuSBqOE/KRTT7KBBG9xRhRMxa1CmgX8963EFrsenMR0J8dXZh
        GhObM0f3EQVZD/zolSYv2jHaIiYOAl+kIZHHe2DZNxADn45Ux6UTyOzqRPHBgh6l
        K2myQfPXn/6Z4a0Xe0Tqf00oVZAyVyVh3ploEUqOdADy+9o93FsUKd3fQfX8RQ58
        pTLTuazf1/84qMPknAwCJ9zEthWbz58YOF9RrPQ0jzIqLnqi0tTpHB/635oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669372560; x=1669458960; bh=VNwX2vXO61X0uYZ41E6oKqEzDNGY
        /LfLxq0bY0q1V4o=; b=RaKRkLs7mG7uIcmMC8LpccBMs+kvNwKUKY+qLQ3Qipkm
        B2pyKVx9D6g6InbwHv5qstm6CYOAk9w58Pcajw1qphopR+TJZjipB3Z/GYeWH52K
        YCSNi9RjyX9qnbh/Y7DN5xvM2xz0ViKErM995i1liOZ+QmP1vwuXUPAKfXQb7lVq
        XzZ+mWrvEZ/F6WriEd1xfgpFLgZcwhOMe2Uun6t0eypSXD6ip4m3DG+N1LyHM54U
        YyDykmX01wYakBMOL4I9rGS+pxnECorBQsO6IvEoArLB0WYhbOUqKYHXgd4ZJvsL
        fsCY6fS0CCniE110o1AI/kGH2WIbZUA/ve5UJwIUWw==
X-ME-Sender: <xms:j5qAY92vv-myF5hbgwOYjdaeYZtmG5EvGcUoOS-0Ur2ajvXK9Qsmcw>
    <xme:j5qAY0GLUMz0y8JjZOYb5yedRpYmFUpKPfbH1hIhmv9okPSfWP1kM-vq_RWyGUbpn
    Za4SbalYYle2IVotZc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:j5qAY94ItBCCAA4VQpRNKfscBWw2ipIGDr-IZBIVWgDbhlT9aBovvA>
    <xmx:j5qAY62mKtJGCF5PBF-9Csg1NhWAL94BunSrFFXG4Z92U_vBUcTlgw>
    <xmx:j5qAYwEqqLe--sS9QskoTZigAU5x_2vvyy6SqlaUI05LG9rFeHaJoQ>
    <xmx:kJqAY48-4eouqPQf8PV-exnBvbDKku3ORZ0tUnV67pN-ZQVAB05P_Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CB7CFB60086; Fri, 25 Nov 2022 05:35:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <abb37a26-1659-4ba0-a621-55fef35f552d@app.fastmail.com>
In-Reply-To: <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
Date:   Fri, 25 Nov 2022 11:35:39 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Binbin Zhou" <zhoubinbin@loongson.cn>,
        "Wolfram Sang" <wsa@kernel.org>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        "Huacai Chen" <chenhuacai@loongson.cn>,
        "WANG Xuerui" <kernel@xen0n.name>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Jianmin Lv" <lvjianmin@loongson.cn>
Subject: Re: [PATCH V3 1/5] i2c: gpio: Fix potential unused warning for
 'i2c_gpio_dt_ids'
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 25, 2022, at 09:54, Binbin Zhou wrote:
> of_match_ptr() compiles into NULL if CONFIG_OF is disabled.
> Fix warning by dropping of_match_ptr().
>
> Suggested by Andy Shevchenko, thanks.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I think this is a useful cleanup in general, though I don't think
there is an actual warning in this particular driver that gets fixed
by the patch, so it would be good to change the changelog text to
describe this better: dropping a matching #ifdef check along with
dropping of_match_ptr() is just a cleanup, while dropping
of_match_ptr() that has no corresponding #ifdef fixes an actual
warning.
