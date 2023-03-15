Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352686BAFBF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Mar 2023 12:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjCOL6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Mar 2023 07:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCOL6r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Mar 2023 07:58:47 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78A313DE1;
        Wed, 15 Mar 2023 04:58:43 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pcOym-0003F0-4Z; Wed, 15 Mar 2023 12:07:36 +0100
Message-ID: <7c29bd74-075f-cf07-6d40-e5b46359f40a@leemhuis.info>
Date:   Wed, 15 Mar 2023 12:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: en-US, de-DE
To:     Conor.Dooley@microchip.com, peda@axentia.se,
        Codrin.Ciubotariu@microchip.com, Nicolas.Ferre@microchip.com,
        wsa@kernel.org
Cc:     kamel.bouhara@bootlin.com, linux-i2c@vger.kernel.org,
        alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, regressions@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <38dedc92-62a2-7365-6fda-95d6404be749@axentia.se>
 <3503471d-2d5e-572b-39e7-d715a909749d@axentia.se>
 <5800be99-3569-6edd-5c71-9e6f1498dc3b@leemhuis.info>
 <2fcfa811-ce5c-9fc8-9837-753299794560@axentia.se>
 <338128fa-69dc-1eaa-3a18-c94565ec8380@leemhuis.info>
 <d9f307f6-7d88-f88d-d619-8786b71eff0b@microchip.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <d9f307f6-7d88-f88d-d619-8786b71eff0b@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678881523;ee331d2c;
X-HE-SMSGID: 1pcOym-0003F0-4Z
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Thorsten here, the Linux kernel's regression tracker. Seems this
regression is still unfixed (please correct me if I'm wrong), so I'm
back with another comment:

On 15.12.22 19:50, Conor.Dooley@microchip.com wrote:
> On 15/12/2022 17:53, Thorsten Leemhuis wrote:
>> On 08.09.22 15:59, Peter Rosin wrote:
>>> 2022-09-08 at 14:06, Thorsten Leemhuis wrote:
>>>>
>>>> Peter, Codrin, could you help me out here please: I still have the
>>>> regression report from Peter that started this thread in the list of
>>>> tracked issues. From Peter's last msg quoted below it seems the thread
>>>> just faded out without the regression being fixed. Or was it? If not:
>>>> what can we do to finally get this resolved?
>>>
>>> No, it is not resolved that I know of. We are only writing during
>>> production, but are working around it by verifying and looping back.
>>> Sometimes it takes surprisingly long for the loop to finish, but
>>> it's not a huge deal. But it is of course not completely satisfying
>>> either...
>>>
>>> Reading is never a problem, so post-production behavior is sane.
>>
>> I still have this regression that Peter reported in late July on my
>> list. :-(
>>
>> Codrin (and maybe Wolfram), could you provide a update please? Afaics
>> this is the state of things (please correct me if I'm wrong!): In an
>> earlier mail
>> (https://lore.kernel.org/lkml/38dedc92-62a2-7365-6fda-95d6404be749@axentia.se/
>> ) of this thread Peter stated that the following patch set Codrin posted
>> mid 2021 helped:
>> https://lore.kernel.org/all/20210727111554.1338832-1-codrin.ciubotariu@microchip.com/
> 
> IIRC (and I may well be wrong as it is not my neck of the woods) Codrin is
> no longer at Microchip. Nicolas, do you know who has taken over this driver?

Nicolas didn't reply afaics, but I just found he in
https://lore.kernel.org/all/176099e2-cbff-1987-f59a-2ca618a9c92a@microchip.com/
mentioned that Codrin left.

Did anyone else take over his duties and that patchset? Or should I file
this under "regressions that were bisected[1], but nevertheless fixed"?
I'd hate to do that when patches to resolve it are actually available
and got stuck in review...

[1] to a change from Kamel Bouhara iirc

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke


>> There where a few review comments from Wolfram, but looks like then
>> things stalled. Can we somehow get this rolling again to finally get
>> this regression fixed?
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I deal with a lot of
>> reports and sometimes miss something important when writing mails like
>> this. If that's the case here, don't hesitate to tell me in a public
>> reply, it's in everyone's interest to set the public record straight.
>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>
>>>> P.S.: As the Linux kernel's regression tracker I deal with a lot of
>>>> reports and sometimes miss something important when writing mails like
>>>> this. If that's the case here, don't hesitate to tell me in a public
>>>> reply, it's in everyone's interest to set the public record straight.
>>>>
>>>> On 30.06.22 09:44, Peter Rosin wrote:
>>>>> 2022-06-10 at 22:51, Peter Rosin wrote:
>>>>>> 2022-06-10 at 09:35, Codrin.Ciubotariu@microchip.com wrote:
>>>>>>> On 09.06.2022 17:28, Peter Rosin wrote:
>>>>>>>>
>>>>>>>> I have not actually bisected this issue but reverting the effects of
>>>>>>>> patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
>>>>>>>> makes the problem go away.
>>>>>>>>
>>>>>>>> I.e. I need something like this in my dts
>>>>>>>>
>>>>>>>> &i2c2 {
>>>>>>>>           status = "okay";
>>>>>>>>
>>>>>>>>           pinctrl-names = "default";
>>>>>>>>           /delete-property/ pinctrl-1;
>>>>>>>>           /delete-property/ sda-gpios;
>>>>>>>>           /delete-property/ scl-gpios;
>>>>>>>>
>>>>>>>>           eeprom@50 {
>>>>>>>>                   compatible = "st,24c64", "atmel,24c64";
>>>>>>>>                   reg = <0x50>;
>>>>>>>>                   wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
>>>>>>>>           };
>>>>>>>> };
>>>>>>>>
>>>>>>>> for multi-page eeprom writes to not time out (a page is 32 bytes on this
>>>>>>>> eeprom).
>>>>>>>>
>>>>>>>> For reference, the current defaults for this SoC/I2C-bus, that I modify,
>>>>>>>> are:
>>>>>>>>
>>>>>>>>           pinctrl-names = "default", "gpio";
>>>>>>>>           pinctrl-0 = <&pinctrl_i2c2>;
>>>>>>>>           pinctrl-1 = <&pinctrl_i2c2_gpio>;
>>>>>>>>           sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
>>>>>>>>           scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>>>>>>>
>>>>>>>> I suspect that the underlying reason is that the bus recovery takes
>>>>>>>> too long and that the at24 eeprom driver gives up prematurely. I doubt
>>>>>>>> that this is chip specific, but I don't know that.
>>>>>>>>
>>>>>>>> I can work around the issue in user space with by writing in 4 byte
>>>>>>>> chunks, like so
>>>>>>>>
>>>>>>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4
>>>>>>>>
>>>>>>>> but that is really ugly and gets slow too, about 20 seconds to program
>>>>>>>> the full 8kB eeprom. With the above in my dts it takes a second or
>>>>>>>> so (a bit more with dynamic debug active).
>>>>>>>>
>>>>>>>>
>>>>>>>> If I run
>>>>>>>>
>>>>>>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom
>>>>>>>>
>>>>>>>> with a source.file of 8kB and the upstream dts properties in place, I can
>>>>>>>> collect the following debug output from at24, i2c-core and i2c-at91:
>>>>>>>>
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>>>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)
>>>>>>>>
>>>>>>>> And then there is no more action. I.e. only a couple of 32 byte pages
>>>>>>>> are written.
>>>>>>>>
>>>>>>>> With the above mentioned dts override in place I instead get this, which is
>>>>>>>> a lot more sensible:
>>>>>>>>
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
>>>>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
>>>>>>>> ... snip ...
>>>>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
>>>>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
>>>>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
>>>>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)
>>>>>>>
>>>>>>> could you please apply this patch-set [1] and let us know if it
>>>>>>> addresses your issue?
>>>>>>>
>>>>>>> Thanks and best regards,
>>>>>>> Codrin
>>>>>>>
>>>>>>> https://patchwork.ozlabs.org/project/linux-i2c/list/?series=255408
>>>>>>
>>>>>> That series does indeed help! I'll reply with a tested-by etc on the
>>>>>> first two patches, I can't test patch 3/3 with my sama5d3 board...
>>>>>>
>>>>>> Thank you very much!
>>>>>
>>>>> Since replying to the actual patches do not work for me, I'm writing here
>>>>> instead. Sorry about that. As stated above, it /seems/ to work much better
>>>>> with these patches. But I fooled myself and there is still some remaining
>>>>> trouble. It is not uncommon that the second (32-byte) page in the eeprom
>>>>> is not written correctly for whatever reason. I do not know why it's
>>>>> always the second page that gets corrupted, but this is a bad problem since
>>>>> the failure is completely silent.
>>>>>
>>>>> Cheers,
>>>>> Peter
>>>>
>>>> #regzbot poke
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>> #regzbot poke
> 
