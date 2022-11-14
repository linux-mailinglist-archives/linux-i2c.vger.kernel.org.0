Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DFA628A6C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 21:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbiKNU3C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 15:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbiKNU3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 15:29:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF50EE17;
        Mon, 14 Nov 2022 12:29:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94C2061455;
        Mon, 14 Nov 2022 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E22C433C1;
        Mon, 14 Nov 2022 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668457739;
        bh=K4HmrMQ73Wqp5/X3xK3jmCOM5qtsuad8CDbwkc4kS9o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g5XeBLhvvs5fGdldayu7RQYrKBtrsH4r9iNAwKB449UHN1EvJlIqcB0RKFmCwwUb+
         XAUrxEY8unkTssZNkvSa4GTlz/NcmD77U5HIMKhlwjKgb7l7mWcenCuR/aGSGD7ibD
         MS3lNwC9+UnPukvKXIvWOeBY8VobctepoIVl5ac3lNCUPxxIeAvVwC8UKRBC3wydyp
         z9ZVo2v8FQpLvar2dMFB4SKK9HTkX4DyqtiQAPO9WT8e6VlY4dbujgBjsXiRIHLdEW
         WAnV2MrACSuAingJW929GlWK1i5skj36S165wki9SkiXgEkRUeF4LNT/NqFjWjS8ew
         DqLzIIv0f1fhQ==
Date:   Mon, 14 Nov 2022 20:41:16 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-iio@vger.kernel.org,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
Message-ID: <20221114204116.5d9169ba@jic23-huawei>
In-Reply-To: <Y3KcsJbE2bxWBjqF@shikoro>
References: <cover.1668361368.git.ang.iglesiasg@gmail.com>
        <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
        <Y3KcsJbE2bxWBjqF@shikoro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Nov 2022 20:53:20 +0100
Wolfram Sang <wsa@kernel.org> wrote:

> On Sun, Nov 13, 2022 at 06:46:30PM +0100, Angel Iglesias wrote:
> > Introduces new helper function to aid in .probe_new() refactors. In ord=
er
> > to use existing i2c_get_device_id() on the probe callback, the device
> > match table needs to be accessible in that function, which would require
> > bigger refactors in some drivers using the deprecated .probe callback.
> >=20
> > This issue was discussed in more detail in the IIO mailing list.
> >=20
> > Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koe=
nig@pengutronix.de/
> > Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> =20
>=20
> Immutable branch here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_de=
vice_id_helper-immutable
>=20
> I merged this branch also into i2c/for-mergewindow.
>=20
> Thank you, everyone!
>=20

Excellent.  Merged that into iio.git/togreg and applied patch 2.

Thanks,

Jonathan
