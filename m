Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFE94C64FD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 09:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbiB1Inz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 03:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbiB1Iny (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 03:43:54 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8A81D0CB
        for <linux-i2c@vger.kernel.org>; Mon, 28 Feb 2022 00:43:16 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0371C586;
        Mon, 28 Feb 2022 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1646037795;
        bh=/gKdAnnuZbroYlaQ/1maEmfHfcReg/Jk+7dXNcIY3XI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mAywKeEgWYu0uwHi0cjc4DPmv+LNIbBCkFIJy0jsetIuZI9D801pbW0qZqvbbILcD
         zMsIoevXT8Rma8I32SE9WoRTrThcUOLqzHrBe+0pMf2RXiOWVlcwuWRO+8U1QFQNi3
         dWebxy0mruYhg4W2qoCUpDnzg9NvOXW20mpF8AJY=
Date:   Mon, 28 Feb 2022 00:43:13 -0800
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Cc:     openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220201001810.19516-1-zev@bewilderbeest.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>Hello,
>
>This series adds support for a new pca9541 device-tree property
>("release-delay-us"), which delays releasing ownership of the bus
>after a transaction for a configurable duration, anticipating that
>another transaction may follow shortly.  By avoiding a
>release/reacquisition between transactions, this can provide a
>substantial performance improvement for back-to-back operations -- on
>a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>reads from 2.28 ms to 0.99 ms (a 57% improvement).
>

Ping...Guenter, any thoughts on this?


Thanks,
Zev

