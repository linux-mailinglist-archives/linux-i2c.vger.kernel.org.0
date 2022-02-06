Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840254AAF46
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 13:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiBFMvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 07:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235893AbiBFMvX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 07:51:23 -0500
X-Greylist: delayed 285 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 04:51:21 PST
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B12C06173B;
        Sun,  6 Feb 2022 04:51:21 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3F17D5C0097;
        Sun,  6 Feb 2022 07:46:33 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 06 Feb 2022 07:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=iB7sQB+HR0zZzq
        fqF6V/y4fSMD6WHmU40dKjddl6GWE=; b=I92EMCIjV/ulOM0Ysw2hT9bxeM9C+P
        whZNjdbpwDr0ubWQdPxXmEcci/B9zaRTfWQ7URdNgDMFqCWFf6VUsXAgnmKArCil
        S3X3326BFnC5zztGrbdSVZKKGPXjVW69A+OzySTi5CA1Uin5bMwrABb9YiXR5OuN
        hNG8cTe4/x9uD8kddmNmG6oq7c8JztS89SQa1ZDdYas9guXH5HF9MUaYhMB0Dmi9
        hagd9muQ9IET4pCO9rqPCe/L+T7Q5U6+kL63C5OZLCJFYnzS9jQvs82EIAPvO1hk
        S4qVf447/wEPpHHvtXT+qJKb7wK+lxNPqd8BnTX5rn6aPtYv3DfkJGtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=iB7sQB+HR0zZzqfqF6V/y4fSMD6WHmU40dKjddl6G
        WE=; b=V59r16DgpWDZ44/2A7kbi4VnOsPkt7HUDaS39bgRubVLEbEYkdYi6XYGS
        Fajq0bPHwbJx2514fmASN9PtrYLhuo/NEQGfdUGyEAr9tXKStg0J+/eGcx0DbyF9
        SssZFjfyYNDqQjagKNDRQDR577UyDKzw8t2VvKnU2M2efzeHz5e3voRGTDp814sz
        vGMwpdpPbxzyHHvBgnx/hWPCPYkbBN+hjeHEFn5u4hGZ7xLeKVh6dM6b5ca2EIKt
        0cG4FVmuGnz9L38glCTe3RdSlp5JTPuZwnEExTVRWqGD4YKypGGr/o37tvi5jILz
        EpUxv1ECsYme7G/fs7Eqh86/S6mNA==
X-ME-Sender: <xms:J8P_YVFsbJ-8QGmGDFK8DTbKZnjhbPsTwsCYNnc4YjpI_KXOK31B5g>
    <xme:J8P_YaUAHauvKZxtrMzemzuR50PO9Kbza9l2hVH0aJCuFl_fUp2SIXhr55WUvMoyE
    zVWS6CMVg1YZphpMXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheefgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeetueduleetfeeuledvleehheeivedvhfekheejjeduhfeileffffduhfek
    ieelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:J8P_YXLcaY8FaUrBmdHMu8YmFjmf0yX6dbYBXWHA6Yfgm-EkEXUMPw>
    <xmx:J8P_YbG0HIbcj0W06pdJ4yUpMx1pNqijn03AfzxgCQfRRGv_4hmzvg>
    <xmx:J8P_YbW5_zFtSvppx5JAuExh8gtEbG-gqUBXzzV0Or63Aky1VoGcqg>
    <xmx:KcP_YdKHgXP_rVLQsIsbcD9QtjuQyDGJqJ3YmEA_H2P9aMzhNjOzlA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C147827402BF; Sun,  6 Feb 2022 07:46:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <6b3ece8e-bba8-425c-91e6-e8b35abbf715@www.fastmail.com>
In-Reply-To: <20220204095914.5678-1-povik+lin@cutebit.org>
References: <20220204095914.5678-1-povik+lin@cutebit.org>
Date:   Sun, 06 Feb 2022 13:46:11 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc:     "Hector Martin" <marcan@marcan.st>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver variant
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 4, 2022, at 10:59, Martin Povi=C5=A1er wrote:
> Drop I2C device-probing classes from platform variant of the PASemi
> controller as it is only used on platforms where I2C devices should
> be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
> raised as up to this point no devices relied on the old behavior.)
>
> Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Reviewed-by: Sven Peter <sven@svenpeter.dev>

