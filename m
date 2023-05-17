Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9728707164
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 20:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjEQS67 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 14:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEQS67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 14:58:59 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530D1210C;
        Wed, 17 May 2023 11:58:58 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A780A320098B;
        Wed, 17 May 2023 14:58:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 May 2023 14:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1684349933; x=1684436333; bh=z3
        Gk38lPhj5TpICvgGyoH4f3MvgXnScoogZHTKqe8Lc=; b=mlPB5pq+EpAI5ap//G
        ukxSZPI/MD0kttTqH0Si5mk1LZjWPciePW2idBgAbxkHjaTgIdZjqCQb3KiqCh4w
        Jk3f2dBK0JenGZ+PiT8KI6F3Cthqew+pLxHejG/qAVCO6syDrUayt9JzYuN59RZz
        6MVGJLhnmRVuuoy3m7QuqAKU6iNmLMdtqBtb1P2j6PDzrpKSNIhs3mKMU/aLT7k+
        HlAr9/qMAaRb4XkfdFR/EgSxYlT3ArWqaF+RwFp4QltOb3vhu9sTxix6w9R5BhbH
        f2MGypm2o76VepnWF95LK5CFOjXbooF+oXi8JkMqRbqFwNVsD7q12OQh02pmCk0s
        hZ5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1684349933; x=1684436333; bh=z3Gk38lPhj5Tp
        ICvgGyoH4f3MvgXnScoogZHTKqe8Lc=; b=PSvk1tUWCOc8qMEfusrcVLd5FORgy
        Oz9VUGVlA5Up27Cb0dpKMjcN0to+GSQlF4uuVvgtUlTGAiOrlAu7+wZ4BeBdWrjS
        JOP55vmbUvpngvNS2hOeV3kLiiUqvXq8P+vj8NrVMzKSL4QDk5Pl705+PGMgyYoI
        T8DaGJIi9kRBzjwAFHEo9eJQ4SBB7U6J9UV2oNXyH/vXYogjGe+zHwLqpWOO7NuW
        Ih9OOVQp/IDeEIP8ExjtJX+ndu3jDk+IMtcEJRaFWtARZH0IMXLsb/gtcPu1k+kC
        IPJ1wxHaSO00lEi5rn2QHHJGX2yqWQHe9iWk6NpUolEi59MW0d7NDloEA==
X-ME-Sender: <xms:7CNlZGpMLrfiQngb6PYD7h_8si0S-6-i3-pwHgDSBEyTEVn_sZpU8A>
    <xme:7CNlZErhCz01BufsV3oq8zZ_oysedlnVDtsouqqOetW5yBX0Qh1lFKO_08yN9LPj5
    DfNlwSEYgM30A>
X-ME-Received: <xmr:7CNlZLPAD36SlkQRkErPjp4rgRmEHbRvlD2O9s6Eb508tzAm16rAY54q7Lb3NGM6SS1T55hNvS0DYdZULVH-KBznhsnhbiNBtzNlXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:7SNlZF5KvfdxqJ8gguq38mSFb10dwFmseQxq7yqDQVuLp_rmIfxqmQ>
    <xmx:7SNlZF7iVNuxMAQdcObARzq9f8RoG4-HatRMFl0oqqWbOUKIfh5Abg>
    <xmx:7SNlZFhyE1p4hEcnp7s1fxuThBWHSVTcbJ5QHmNm-Rr1c9mCGVxEdA>
    <xmx:7SNlZKrjY9owYptfaB5bPDvBlGf36-qRB6qkMRP10g-Sd0nMnzHw3g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 May 2023 14:58:52 -0400 (EDT)
Date:   Wed, 17 May 2023 20:58:49 +0200
From:   Greg KH <greg@kroah.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for
 dGPUs
Message-ID: <2023051742-guiding-footing-3527@gregkh>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-3-mario.limonciello@amd.com>
 <ZGULZU01tdqm1Xoc@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGULZU01tdqm1Xoc@smile.fi.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 17, 2023 at 08:14:13PM +0300, Andy Shevchenko wrote:
> On Tue, May 16, 2023 at 01:25:41PM -0500, Mario Limonciello wrote:
> > power_supply_is_system_supplied() checks whether any power
> > supplies are present that aren't batteries to decide whether
> > the system is running on DC or AC.  Downstream drivers use
> > this to make performance decisions.
> > 
> > Navi dGPUs include an UCSI function that has been exported
> > since commit 17631e8ca2d3 ("i2c: designware: Add driver
> > support for AMD NAVI GPU").
> > 
> > This UCSI function registers a power supply since commit
> > 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> > but this is not a system power supply.
> > 
> > As the power supply for a dGPU is only for powering devices connected
> > to dGPU, create a device property to indicate that the UCSI endpoint
> > is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
> 
> ...
> 
> > +static const struct property_entry dgpu_properties[] = {
> > +	/* USB-C doesn't power the system */
> > +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> > +	{},
> 
> Comma is not needed in terminator entry.

But it's encouraged!
