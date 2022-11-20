Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8125263142F
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 13:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKTMtf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 07:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiKTMtJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 07:49:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C399624C;
        Sun, 20 Nov 2022 04:49:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E990A60C50;
        Sun, 20 Nov 2022 12:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E92C433D6;
        Sun, 20 Nov 2022 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668948548;
        bh=nz8FaCJsE6nQVjYd6opo+NOxNY7O1Q6mlJqMIbxZRMA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CfBDyuF9Cy0rbRKEIaAYE8BTmDFFcpzd2NDMKBrCrT38RjT9IgOgqn6+3SeJjGG0c
         m8doMp+iGOIfHLvN7dlkzgOIPDvZLTgU2I2bwbIRn/73sAHrbhDRqTyFNPSXXEVdF1
         zF+mLkSCQ3EhSW602Yc6bIsWoa6lxat0aAHZ2xHNJzc0BRpRBPXyuVA41AVR3by1RC
         uQC7H1YtziEI9jEl9cWbyqaESYSVHKanB7HUvvd+A9Gq3JjvPu6ZxzPR3uyQZFFJzp
         p7IcEgCv/OKH2blBDShYcre/8Dc65MvvScAHK9TJFLwy1aB9OR7a5/MJ5OqKU9svtT
         zXNf4qjhnuD6A==
Date:   Sun, 20 Nov 2022 13:49:01 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?UTF-8?B?S2xlaW5l?= =?UTF-8?B?LUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's
 .probe_new()
Message-ID: <20221120134901.5f4c0d99@thinkpad>
In-Reply-To: <20221118224540.619276-289-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-289-uwe@kleine-koenig.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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

On Fri, 18 Nov 2022 23:40:22 +0100
Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> wrote:

> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
