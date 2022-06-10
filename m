Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA44C54655D
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 13:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239495AbiFJLSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 07:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349158AbiFJLSb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 07:18:31 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D33314A939;
        Fri, 10 Jun 2022 04:18:28 -0700 (PDT)
Received: (Authenticated sender: peter@korsgaard.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8178FC000E;
        Fri, 10 Jun 2022 11:18:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
        (envelope-from <peter@korsgaard.com>)
        id 1nzcem-0031zo-Eo; Fri, 10 Jun 2022 13:18:24 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER
References: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
Date:   Fri, 10 Jun 2022 13:18:24 +0200
In-Reply-To: <20220610105154.2358-1-lukas.bulwahn@gmail.com> (Lukas Bulwahn's
        message of "Fri, 10 Jun 2022 12:51:54 +0200")
Message-ID: <87leu4ydfj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Lukas" == Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

 > Commit 8ad69f490516 ("dt-bindings: i2c: convert ocores binding to yaml")
 > converts i2c-ocores.txt to opencores,i2c-ocores.yaml, but then adjust its
 > reference in MAINTAINERS to a slightly wrong new filename.

 > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
 > broken reference.

 > Repair this file reference in OPENCORES I2C BUS DRIVER.

 > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
 > ---
 > Conor, please ack.
 > Wolfram, please pick this minor non-urgent clean-up patch for your -next tree.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
