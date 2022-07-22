Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD5357E41D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 18:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbiGVQHr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 12:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235645AbiGVQHd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 12:07:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB03E2C11A;
        Fri, 22 Jul 2022 09:07:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7BCAFB82965;
        Fri, 22 Jul 2022 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028A5C341C6;
        Fri, 22 Jul 2022 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658506048;
        bh=5yJocOcL05K+d32MD68eU+SES1IoxYGjQASgo+upaTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cCJThHET412NCDTUriBUl6zNGXCxuoWBYvJdB+zQBM+Uz6TLiGskh3DQdzjmSQxVO
         4CA+JXCAY7zb/RQLnhMaiQVKVnLYV+xfUKx/62Fveyrpt7K2w4dut36LMtHi/0ZR3W
         87sIh9E8Zp1ymJZAS5WyCZiwR7u3jfu8T823qV8I8pHeApC/Fy6mXE4/cjM5sj+Hch
         dcpZQSx93ZAr01IlHQyil/qbtBgva/3rZQYefcgVtKit0zXlcqWskIQ92zG4lmqdL+
         OC6YwoHYmoEDcocR+tTD+jwgEKHPq5SgEirRs7yy94G1TGt0WA5x/TxsHL3ZUf2Aij
         NCeZax9dYNoEA==
Date:   Fri, 22 Jul 2022 18:07:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YtrLMr0UeSSKxTFP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220708100350.12523-1-phil.edworthy@renesas.com>
 <20220708100350.12523-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708100350.12523-3-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

Geez, you are right with "yet another". One wonders why the 5 others are
not enough?

> +static int rzv2m_i2c_master_xfer1(struct rzv2m_i2c_priv *priv,
> +				  struct i2c_msg *msg, int stop)

I'd prefer "rzv2m_i2c_master_xfer_msg" for this function.s

> +	adap->class = I2C_CLASS_DEPRECATED;

You don't need to set the class to deprecated because there can't be a
previous version which now loses this functionality and needs to inform
userspace about it. .class can be 0 here.

Reset looks looks, good thanks!

I can fix up these minor things when applying if you don't mind.

Happy hacking,

   Wolfram

