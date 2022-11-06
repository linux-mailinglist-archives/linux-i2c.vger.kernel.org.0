Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B261E31F
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 16:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiKFPsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 10:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiKFPsL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 10:48:11 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651AADE9C;
        Sun,  6 Nov 2022 07:48:10 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id CE0265C007E;
        Sun,  6 Nov 2022 10:48:07 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 06 Nov 2022 10:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1667749687; x=1667836087; bh=Dq
        D51ZNiiHRbL8EMSbFqH1TZF8golg5Oh2aWT+koTb4=; b=W0ssXIi7rZL9NggqPx
        Fn8j2zuBdrhPj3LfR2MdduqGdrrsm1WwRuRVF8RHLdypR5LFTnZlur0D9FNybjl3
        zwSOGChnDQ/7pvAW0uPeVEJxFmWptxELM8S7jn6oMU0JRBmlv55BVTj4oS3MGe9l
        Sc7aQRClJSayZ+62ZQXsKhyXD6N+53uwLnsXTxWOgc9rw1ReTH68Q1mBGTDrkERR
        2xGmHf6PDj6EVfk39qMyitGxelkwslqReeKK0d0TIgj7ncXxj3+1hc3Npvrvs/oF
        scaYHkwcKLMzEnsSgrjXMYHOqlx2f1Zdgi3g+qZldYsbXY1QNigzU8tM2kwPtkxU
        0FMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1667749687; x=1667836087; bh=DqD51ZNiiHRbL8EMSbFqH1TZF8go
        lg5Oh2aWT+koTb4=; b=EYUxi4vmHt+yoQv+jgGzetAa+wztr68XqFUChrufz8My
        oXy+FNVXFuRnCCIzW8m11qccVKuC+lvnqrNvsPSlnlLnP2nAOYrIAssKFIesotI5
        1aabhaHObdS/njkSMKzTgNo5hi/ZEcDPk1PM2nEpWKvF8Vh+cVoIyIHD8MA8gK6a
        MirofWadqPG1WvCPnFPAqO97njG0Noy+E7gYTdH2zK67El7E2djjkoSV9I5Fo9DN
        +2gi2OD0Pp/brsXtJZgBL2iTgR+1R9ostZ1yt+t37EfNHHZaZ97wKZIEMxYrKsF5
        dyghw4t354PFIv4j234Q2mfVkatFekoUVdAzF2iksQ==
X-ME-Sender: <xms:NtdnY8yEgMKtga3ctHbBASc4daMNLqGnUQh8F4Eh6_Pgv2umtyENsQ>
    <xme:NtdnYwTvDeSZ5MSbs6AE4cOfjRq61Do_7FgK9pzhO-cVHdAG2cP0qOv5xOyrvvrxS
    oIVgw1MMIfpxV2oZts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdeigdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefghfei
    veeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:NtdnY-W0vGVCi_VQkBDbWjSG-iOb6VYkhXDC6AtOSaiG8e0JhRIBfA>
    <xmx:NtdnY6gv3nmvTtFcygmm4GDyjpO5Nbj_HrR17Uyl5Dp5J8RF2uB8cA>
    <xmx:NtdnY-D-jl1YcCL1cA2KPJ92EYz_UvOtR47b8ohmGsLR4PbrU5sInQ>
    <xmx:N9dnY2uK_mLKrt0npg82U7vr1mIYYw78-qt-oIwa3SMHK3U8rUtCoQ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8EE9EA6007C; Sun,  6 Nov 2022 10:48:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <41e0d093-3bd4-444a-935e-01daae537c70@app.fastmail.com>
In-Reply-To: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
References: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
Date:   Sun, 06 Nov 2022 16:47:41 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arminder Singh" <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel@lists.infradead.org,
        "Paul Mackerras" <paulus@samba.org>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Hector Martin" <marcan@marcan.st>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        asahi@lists.linux.dev
Subject: Re: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sat, Nov 5, 2022, at 12:56, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While primarily intended for Apple silicon platforms, this
> patch should also help in enabling IRQ support for older PASemi hardware
> as well should the need arise.
>
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Thanks for following up on this! This looks good to me now.

Reviewed-by: Sven Peter <sven@svenpeter.dev>



Best,


Sven
