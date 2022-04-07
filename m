Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A274F7F62
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 14:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiDGMqL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 7 Apr 2022 08:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245371AbiDGMqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 08:46:10 -0400
X-Greylist: delayed 65 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 05:44:11 PDT
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A452FC131;
        Thu,  7 Apr 2022 05:44:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="73983575"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 07 Apr 2022 04:43:05 -0800
IronPort-SDR: qil+dP4+M93KfKqdu8Ka66cgFkLAFSYFvqhg8mI/CYl3PI8d6oIlwZX7CgawE/2psBAOOtD1BO
 uLxHHyzP8qkbuytjDNtWgXtkBHG9+bwz6BgV/oCoCZqVd9o/z2TFuUbEgByiaymSoBXOYpbgN9
 afv3QLJjSZCYijXe7aYxZsCs7h05FZcIx0AGxpB1jFsqADXICVW94mLizaZY0oxNkaRTyLFkq/
 Umh287JNJfb+EcPBm5k7O5GRYUak6Bmp4+WOBwzWn3rnMlJWCTasAjHGMS+QRnWp9F1whbAosO
 suo=
From:   "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Thread-Topic: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Thread-Index: AQHYSNUQyopoQTRIREK+Oe0vqly5pazkTnWwgAACLQCAABbrbw==
Date:   Thu, 7 Apr 2022 12:42:59 +0000
Message-ID: <1649335378392.75260@mentor.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
 <1649330034935.59928@mentor.com>,<Yk7WfPUVa6l25RbM@shikoro>
In-Reply-To: <Yk7WfPUVa6l25RbM@shikoro>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > Besides avoiding of double assignment of that "length" byte to the buffer,
> > this move will avoid pollution of the buffer in case of an error (invalid length).
> 
> This was intendend as a feature not a bug ;) This was the reason I put
> the data to the buffer at the beginning, so people could see the wrong
> data length. But yes, it can be argued if it should be logged somewhere
> instead of being in the buffer. I'll check what other drivers do.
> 
> Sidenote: It is planned to add SMBus3 features somewhen. Then, there
> won't be an invalid length anymore because it allows 255 byte transfers.

Fair enough. That makes sense.
I withdraw my proposal then ;-) Sorry for the noise.

Thanks.

Best regards,
Andrew
