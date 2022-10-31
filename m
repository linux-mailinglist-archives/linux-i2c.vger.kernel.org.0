Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF24613BF8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Oct 2022 18:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbiJaRM5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 31 Oct 2022 13:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbiJaRM4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Oct 2022 13:12:56 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966E112D0E;
        Mon, 31 Oct 2022 10:12:54 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1opYLE-003szj-4W; Mon, 31 Oct 2022 18:12:52 +0100
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1opYLE-003e4Z-8i; Mon, 31 Oct 2022 18:12:51 +0100
Message-ID: <dd07edbd62c7600996c7e7291c8ab819b8799319.camel@inka.de>
Subject: Re: [PATCH v3 10/12] HID: ft260: wake up device from power saving
 mode
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     Michael Zaidman <michael.zaidman@gmail.com>, jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com
Date:   Mon, 31 Oct 2022 18:12:51 +0100
In-Reply-To: <20221030203403.4637-11-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
         <20221030203403.4637-11-michael.zaidman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Michael,

On Sun, 2022-10-30 at 22:34 +0200, Michael Zaidman wrote:
> The FT260 can enter a power saving mode after being idle for longer than
> 5 seconds.
> 
> When being woken up from power saving mode by an I2C write request, it
> looks like a possible NACK will not be correctly reported back. As a
> workaround, the driver will request an I2C status report before starting
> the next I2C transfer if the FT260 has been idle for longer than 4800ms.

Unfortunately, I have found issues with this patch as it is. When I
tested from an installation running in KVM, I saw missed NACKs again.

A possible fix seems to be to send the extra status request after the
output report triggering the write. See
https://github.com/MichaelZaidman/hid-ft260/pull/7.

Cheers,
Enrik
