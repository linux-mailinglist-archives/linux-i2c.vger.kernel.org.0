Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942065474E0
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jun 2022 15:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbiFKNls (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Jun 2022 09:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiFKNlr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Jun 2022 09:41:47 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DBDB2F;
        Sat, 11 Jun 2022 06:41:46 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1o01Mz-0003Hv-Qn; Sat, 11 Jun 2022 15:41:41 +0200
Message-ID: <a32f84e1-33d1-08ea-8912-cf2311532df8@leemhuis.info>
Date:   Sat, 11 Jun 2022 15:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: en-US
To:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1654954906;31ae75de;
X-HE-SMSGID: 1o01Mz-0003Hv-Qn
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 09.06.22 16:28, Peter Rosin wrote:
> Hi!
> 
> I have not actually bisected this issue but reverting the effects of
> patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
> makes the problem go away.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced a4bd8da893a3
#regzbot title i2c: at24 eeprom writing times out on sama5d3
#regzbot ignore-activity
#regzbot monitor:
https://lore.kernel.org/all/20210727111554.1338832-1-codrin.ciubotariu@microchip.com/

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replied to), as the kernel's
documentation call for; above page explains why this is important for
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.



> I.e. I need something like this in my dts
> 
> &i2c2 {
> 	status = "okay";
> 
> 	pinctrl-names = "default";
> 	/delete-property/ pinctrl-1;
> 	/delete-property/ sda-gpios;
> 	/delete-property/ scl-gpios;
> 
> 	eeprom@50 {
> 		compatible = "st,24c64", "atmel,24c64";
> 		reg = <0x50>;
> 		wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
> 	};
> };
> 
> for multi-page eeprom writes to not time out (a page is 32 bytes on this
> eeprom).
> 
> For reference, the current defaults for this SoC/I2C-bus, that I modify,
> are:
> 
> 	pinctrl-names = "default", "gpio";
> 	pinctrl-0 = <&pinctrl_i2c2>;
> 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> 	sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
> 	scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> I suspect that the underlying reason is that the bus recovery takes
> too long and that the at24 eeprom driver gives up prematurely. I doubt
> that this is chip specific, but I don't know that.
> 
> I can work around the issue in user space with by writing in 4 byte
> chunks, like so
> 
> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4
> 
> but that is really ugly and gets slow too, about 20 seconds to program
> the full 8kB eeprom. With the above in my dts it takes a second or
> so (a bit more with dynamic debug active).
> 
> 
> If I run
> 
> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom
> 
> with a source.file of 8kB and the upstream dts properties in place, I can
> collect the following debug output from at24, i2c-core and i2c-at91:
> 
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)
> 
> And then there is no more action. I.e. only a couple of 32 byte pages
> are written.
> 
> With the above mentioned dts override in place I instead get this, which is
> a lot more sensible:
> 
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
> ... snip ...
> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)
> 
> Cheers,
> Peter

