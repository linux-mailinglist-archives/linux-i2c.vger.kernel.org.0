Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14466A8776
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 18:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjCBRA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 12:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjCBRAz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 12:00:55 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F42263D0B3
        for <linux-i2c@vger.kernel.org>; Thu,  2 Mar 2023 09:00:54 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 473F932001AB;
        Thu,  2 Mar 2023 12:00:54 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Thu, 02 Mar 2023 12:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1677776453; x=
        1677862853; bh=h7/qLted0CpOaDsyEStCyuCAdRe9Fvy1Zs3mCmUOikE=; b=k
        iRTktYk5aDVDrtwOOBfLslIEVvIaUurqMHqPaiSkCloAKIwMKj5fyMVspSzh6Yo9
        WrYWzG4LnEimAYOY09vuqG6oQPo00J8Hcf/KCR3fYIJVvGMEQcPqOEe0T1DHj2N+
        f+7imBv2WGPXBlK66SGUrDNynrki2gDF2QZx7GyO7P+q51XLdwITvdUh2hIfPZ5T
        AKUPom2ZSWZsB6v7VKWNA5mk51n9Yes1XmwuC0l6GnYwpY27EGWm1L6RpxSgyhcv
        uY5tcFZnaB29aa3IpWqQAG4hE7jY3ZNkfdOeQI9c5EVADD8Ow+Qzq/M/wIMullwJ
        /DO4Gwcg3Fgzkn/yDk7Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677776453; x=1677862853; bh=h7/qLted0CpOa
        DsyEStCyuCAdRe9Fvy1Zs3mCmUOikE=; b=EvmgXlhe0dxl0mSDvbqOHy9giMMat
        Drq5lGVchlh10+oJzpjJctMxs7YWne4hlFruBvDuD8zMrPGbLK2OFaE7rbKjn03P
        yWhxqPmEslHVXdvG9aFYdGNtkmxZJJrJZbZMmHUbu9uXuIrYSiasxxM5uxBecbsy
        2FzNTtimdrw5wngVKcp4EV96iXoFbL66UCAbQl0c/0ANJyuBOREA3eIbHvZlrYkM
        YRebg0Hz8WbSqK62ovWKZObXKAfKYzl9oi2gfhFvszAtoQWVYtSmSelUlghwUowp
        /Rz3ZPjyfZ+pmUAcYUP5luaEsN0UWg+YRAEgjOrG638pivxe5HaV81xAw==
X-ME-Sender: <xms:RdYAZBIeG6d4Spa91DbYotJBX7GKF_pe7Qe0hfLh95i8lXxRcBxnng>
    <xme:RdYAZNIVHiAWFHiUj7xsTLEmSfA-ZRFGM_cjoMSQIXoH4BpTHtwlNx_fYA05Lbk1M
    K2X-75J3eW1pT3JB60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeljedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepkeelkeduledvvdfhfefhlefgffefgfdvheejgeejhfehjeejgffffeei
    jedtteejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdr
    uggvvh
X-ME-Proxy: <xmx:RdYAZJtOYuWHVP4HEcLAl9EwBF_mxVanWlyW0_itMfC5BwN0I1basw>
    <xmx:RdYAZCYmQiMrOcgCUrXTCwnntRmpZdAgx5XtItbFxHCQFCTNlX8_xw>
    <xmx:RdYAZIYmvMwQ-Xs87xTob951qasx-aWV3-sVzffmKfPnVXFKPLLTgg>
    <xmx:RdYAZDyQDdoQwA7-XqwPIpnDNNvPZTqRn-hJ7og57d4VE76eD0u2iw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4FF56A6007C; Thu,  2 Mar 2023 12:00:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <4cd87458-d3c5-4ec8-b3af-99bfc4c02ee3@app.fastmail.com>
In-Reply-To: <20230227233318.120415-1-bgray@linux.ibm.com>
References: <20230227233318.120415-1-bgray@linux.ibm.com>
Date:   Thu, 02 Mar 2023 18:00:53 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Benjamin Gray" <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     "Arnd Bergmann" <arnd@arndb.de>,
        "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] i2c: Disable I2C_APPLE when I2C_PASEMI is a builtin
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tue, Feb 28, 2023, at 00:33, Benjamin Gray wrote:
> The ppc64le_allmodconfig sets I2C_PASEMI=y and leaves COMPILE_TEST to
> default to y and I2C_APPLE to default to m, running into a known
> incompatible configuration that breaks the build [1]. Specifically,
> a common dependency (i2c-pasemi-core.o in this case) cannot be used by
> both builtin and module consumers.
>
> Disable I2C_APPLE when I2C_PASEMI is a builtin to prevent this.
>
> [1]: https://lore.kernel.org/all/202112061809.XT99aPrf-lkp@intel.com
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>



Best,


Sven
