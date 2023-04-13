Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695D56E0AD4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjDMJ6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 05:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDMJ6d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 05:58:33 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764D765BC;
        Thu, 13 Apr 2023 02:58:31 -0700 (PDT)
Received: (Authenticated sender: peter@korsgaard.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A67FA1BF207;
        Thu, 13 Apr 2023 09:58:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
        (envelope-from <peter@korsgaard.com>)
        id 1pmtik-0081YI-BY; Thu, 13 Apr 2023 11:58:26 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Federico Vaga <federico.vaga@cern.ch>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        Gregor Herburger <gregor.herburger@tq-group.com>
Subject: Re: [PATCH v2] i2c: ocores: generate stop condition after timeout
 in polling mode
References: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
Date:   Thu, 13 Apr 2023 11:58:26 +0200
In-Reply-To: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
        (Matthias Schiffer's message of "Thu, 13 Apr 2023 11:37:37 +0200")
Message-ID: <87ile0qf25.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Matthias" == Matthias Schiffer <matthias.schiffer@ew.tq-group.com> writes:

 > From: Gregor Herburger <gregor.herburger@tq-group.com>
 > In polling mode, no stop condition is generated after a timeout. This
 > causes SCL to remain low and thereby block the bus. If this happens
 > during a transfer it can cause slaves to misinterpret the subsequent
 > transfer and return wrong values.

 > To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
 > instead of setting STATE_ERROR directly. The caller is adjusted to call
 > ocores_process_timeout() on error both in polling and in IRQ mode, which
 > will set STATE_ERROR and generate a stop condition.

 > Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
 > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
 > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
 > ---

 > v2: style improvements based on feedback from Federico and Andrew. I went
 >     with a slightly different solution than Andrew suggested to avoid using
 >     the ret variable for two different kinds of returns.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
