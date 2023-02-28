Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1353A6A548C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 09:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjB1IjL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 03:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjB1IjK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 03:39:10 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26C5F760
        for <linux-i2c@vger.kernel.org>; Tue, 28 Feb 2023 00:39:08 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 48E455C025D;
        Tue, 28 Feb 2023 03:39:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 28 Feb 2023 03:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1677573548; x=1677659948; bh=2GC7m7ynma
        ETUAb1Ik6X03v+DzIkaZEnOTkHqYHWiW8=; b=P6XqKuKsj5pIBN9hjCmPO9PR+1
        3e+pnY+pvz4Mx05Mf7yKVW8j1tswGXz5RoUYkCDsrZbvShj6F5a3JmtIiKhUjaZS
        O+2Z2DKCnatBYcXBlgS11YHZr3jjwguWukOUE5bIhcVQdjW5ZN6FUTgH98o1H+ZQ
        izaujrPEeZItej7iyYPblT+Csk9Kr1vzzKQfjVzCYvYbb11StQ2zh5lAKg63zIJO
        Z3WFgimR0mj01axAZhEQSHkg8tOnYNfhf2UaKrEwGJvoHELyX/SuO5rC/vUBWwDX
        GtU3Z5z/D59gkEPUQ5JBlNZocOkg0RpykZym/Pq5V2/Cgp5pxYNPS9P6mqjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677573548; x=1677659948; bh=2GC7m7ynmaETUAb1Ik6X03v+DzIk
        aZEnOTkHqYHWiW8=; b=da7RXHgSYHskmQtkANQkf4Ujb6ltpZVoa+SVYodZEt9O
        doqnu/p7lbO5fHV6ekg3G+eem2ibwckB5ZVSqC7xmPqZxwfD2H26TzlJPUR4X7G0
        eOskq34xbGFU1gDL47QZ6uaVbi5l5W0gN9e4XsctxP8KOrMawiCz11UwNnr/XNXR
        pH9sspVK2aNWHfEjz6rgv+gilCcEnii/C2CWJutF6DkP6+x2lr4Cq3cIcYp8HoGN
        O7+uiH7kQUKUM2anZjAwSBqA5X4kEmltDy7qJoh6qYxBl5PYfXlrW0ZcUd8Rl04q
        RWI9nuQpkUHp8jwne90DLaHwK4o3gc1cQgyWZ2lb+w==
X-ME-Sender: <xms:q739Y4gqha1YiGbqQG4ACnBziUCMHVVI5EaICO5QytW8UNEPwmEbyw>
    <xme:q739YxBoP_PNCyO9Y8VSaj3YYQ7PpmYTZVNQG6OCpdp7fpp9CcIZqyTcvDTPpwVOC
    9rjGbHis-Rgh-IGvLE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeluddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rL39YwEHnk8yr1G0FOJI8VymzN3VK5tweMCd40dtj7EnXMFIloJhWQ>
    <xmx:rL39Y5RNY3i1us0F140VfxZSRvR3ARp2OzUaTaZ5CBrPeN8A5BCpsQ>
    <xmx:rL39Y1zErpJllLXJFfj5-22EB6S8z3WfIbPoAny6T29XQmrEBNWZ3A>
    <xmx:rL39Y2r3tm_wHDkqKxn0QadVP4lBhB_gJknbubdJzZ_Mgwknrfj-cA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DC2F4B60086; Tue, 28 Feb 2023 03:39:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <dd6984e0-38f4-40d0-a7ac-bea312d4d68a@app.fastmail.com>
In-Reply-To: <20230227233318.120415-1-bgray@linux.ibm.com>
References: <20230227233318.120415-1-bgray@linux.ibm.com>
Date:   Tue, 28 Feb 2023 09:38:47 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Benjamin Gray" <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     "Sven Peter" <sven@svenpeter.dev>,
        "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] i2c: Disable I2C_APPLE when I2C_PASEMI is a builtin
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
