Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64ECE759D46
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 20:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjGSSag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 14:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjGSSae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 14:30:34 -0400
X-Greylist: delayed 475 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 19 Jul 2023 11:30:33 PDT
Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com [IPv6:2001:41d0:1004:224b::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDD6172E
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jul 2023 11:30:32 -0700 (PDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689790953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U+h7nF3iHJyXPGTjQCGPc4jOSdU2SFBb4VhoriSzvmw=;
        b=Mbu00FFURdQu9G26tCptH/9qN208NliBSpa/YWw7dlECzT5NyEOnLR7wUuD0kg/NU2XbvU
        4OAlFJTZF4XaJaWu1rVQdLU/t3+h53J2M/H0op2r3NCU1RryfiTvW7JEidUC+ZAHzW+7bM
        eOSoidOQ+eINfYGKuGPARqi9urbNJw0=
Date:   Wed, 19 Jul 2023 18:22:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <58d0c47502218fd689c5ecd100ba0d5d02d89926@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v7 5/5] mfd: tps6586x: register restart handler
To:     "Benjamin Bara" <bbara93@gmail.com>, dmitry.osipenko@collabora.com,
        konstantin@linuxfoundation.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com, jonathanh@nvidia.com,
        lee@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org
In-Reply-To: <20230719082251.3501424-1-bbara93@gmail.com>
References: <20230719082251.3501424-1-bbara93@gmail.com>
 <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

July 19, 2023 at 4:22 AM, "Benjamin Bara" <bbara93@gmail.com> wrote:=20
>=20@Konstantin:
> Do you think it makes sense to print a warning when adding "non-standar=
d
> trailers" during running "b4 trailers -u", maybe around the
> find_trailers() checks? I could provide a RFC, if considered useful.

With b4 being used for other projects than just the Linux kernel, I don't=
 think it makes sense for us to track what is a valid and what is an inva=
lid "person-trailer". I know that we could make it configurable, but I do=
n't think this will actually improve the situation.

One goal for b4 is to allow defining validation tests and requiring them =
prior to "b4 send", so I think this is a better mechanism for dealing wit=
h such situations.

-K
