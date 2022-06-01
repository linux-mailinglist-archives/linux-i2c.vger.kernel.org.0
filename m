Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7A553A61E
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 15:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353303AbiFANsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 09:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353315AbiFANsL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 09:48:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1A649CA1;
        Wed,  1 Jun 2022 06:48:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0078614CE;
        Wed,  1 Jun 2022 13:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F41BC385A5;
        Wed,  1 Jun 2022 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654091289;
        bh=KiL5BvWqhNPGED68YvrkKSQgsDTtUC2fUGyGtvdLs4s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RAk5kWpQLTjo1aXif/PdOu8QT8gRwdT/X5oncbz9tpaM6osET27O46ImbGfIKqU15
         G/9Buka6wSPgyAt2YY4KWnu6hv0K6aezFuE/JM1cNl3cMzRG6qA3lCCs3nc/Va3dLf
         PXqxh8ZpdFLKorRWE27U3TAUvwENNMNja8jIJwkEXtnmgXFikpsBPjIGx9nLxkf1+F
         A/wS3V7q85b+DjroBJxGvkfXRzaqFSuSDynkF3xcHpFBtJh2QESEad6ER/6qWmV7sX
         io2Ov2QpJFjCZGr0prunhs5kLS2agnAzKWi4msl1UnItEnxmCOIwuTZjU/fwUdbLfP
         mhwlrIOKyklYg==
Message-ID: <29521c9c-90d3-03b9-cf6f-8519efcd007e@kernel.org>
Date:   Wed, 1 Jun 2022 08:48:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv2 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220524135441.420600-1-dinguyen@kernel.org>
 <Yo0LKQchQwitJVHm@smile.fi.intel.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <Yo0LKQchQwitJVHm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/24/22 11:43, Andy Shevchenko wrote:
> On Tue, May 24, 2022 at 08:54:40AM -0500, Dinh Nguyen wrote:
>> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
>> thus cannot be recovered by the default method of by doing a GPIO access.
>> Only a reset of the I2C IP block can a recovery be successful.
> 
> Better now, but see my additional comments.
> 
> ...
> 
>> +	switch (dev->flags & MODEL_MASK) {
>> +	case MODEL_SOCFPGA:
>> +		rinfo->recover_bus = i2c_socfpga_scl_recovery;
>> +		break;
>> +	default:
>> +		rinfo->recover_bus = i2c_generic_scl_recovery;
>> +		break;
>> +	}
> 
>> +	adap->bus_recovery_info = rinfo;
> 
> Usually we do not assign the pointer while data structure is incomplete.
> That's said, please leave this line as it was.
> 
> On top of that, why you can't move the above switch to the place where old
> function was assigned?
> 

The reason is the assignment of the recover_bus needs to get done before 
the call to devm_gpiod_get_optional(), otherwise, the assignment is not 
taking place because of an error after returning from 
devm_gpiod_get_optional().

Dinh
