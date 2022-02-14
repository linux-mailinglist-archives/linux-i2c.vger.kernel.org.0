Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58154B40FF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 05:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240391AbiBNEvP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Feb 2022 23:51:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbiBNEvP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Feb 2022 23:51:15 -0500
X-Greylist: delayed 563 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 20:51:07 PST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5CE50469;
        Sun, 13 Feb 2022 20:51:07 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 65D4B32003C0;
        Sun, 13 Feb 2022 23:41:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 13 Feb 2022 23:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=hMSfqQqkZrtVpI
        9iLRc/m5fhQ1A+earhsgZZG+w4a1A=; b=QZ6TZ169n22gAPWqllYPmeUiu+fUtZ
        vYoGS4mDGXNEklhlVk88MG56Wv+1wTzqru+nn76Lvh7TfuljlvUmTrRjl1Gn0lcB
        WfkUFi69CTnVrQgci//5IbJ55jl8iY43EzGWGzLwI9FoCRBQrLIAii9FRnQ1cKs3
        ZKwnwwLlY/AICOPQjn9o1/20TzyRN+1zeLxDkVVbM3sM52DRIVSSiEIhYGs8NpQL
        HN5sc5yA2eHYJj9XoNhpTrKowGlIEmNy1rpXqV8qRUke+vb66oMYTxecJRILA1uX
        boRB7FoIX7wL8MLASrx5JX7ZgnLFoKXTsk783Zs+8JyKaTt9w1ZYJ4RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=hMSfqQqkZrtVpI9iLRc/m5fhQ1A+earhsgZZG+w4a
        1A=; b=SjSjLEnMAzrxFanQ1T7qMkek5S6UwXFhankMgcVqYxfaLWZfRFNrmQ3U4
        f0tiCSTkE6+hhwtobLo9y/n2N6vVfI0MP3eQSy7u1F+DGHlzwxMjd43HDSZ1hjaE
        XP10knRiR5jmPu3CCQkqr8O3UCngo7+UVH2LT21XJDGUjF30p5oLgBeX5e1vWO10
        Qmz84WMcudJ76BMj4MJkjTEkQZ2qh++GR3xn+bZhNLZ0LI9vpsj6JFjQpbLvv3Dx
        mPfr9vsSpg98vAd0z4D4EW1zrLsHIt6cbuFMVWpXOF6ylRPYRJ8Jj319WXKupSCT
        d97bPg83iQ3MoawzQUr3qqxgDe+Aw==
X-ME-Sender: <xms:ht0JYtWgR62DovYvIf9nH4qE_WKfno3juCLznfs_NpJoIo9zXFVgbQ>
    <xme:ht0JYtn0UGT82f4MP1wb8eNblqxbAJGi3cuXAYWWAktBKQEw1LwO2jDrcAgKtqZL2
    p6JNNPURua6LH8e5w>
X-ME-Received: <xmr:ht0JYpaO308rrhFPTP4egbhVTT60qTYissQapPe4kCQsxOkoFTO1IwuDPoBbi0l-jgiIulIlVBvtGU6OtWUs4yq6GuTOuLtWJSH5penfYGDg5C3QoxhierCssg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeffiefgledvgfdtteeludevvefguddtiedutdevtedvhfffjeelhfeh
    teejtedvleenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ht0JYgXmdadH_roct5AIBMv1I89O59PFl_5Xzyd5pZDZmWlIfHVG8A>
    <xmx:ht0JYnkyu9iFn25IagIcrlFs61AT2fowA2oUi8G--X_gzPqbbdEbfw>
    <xmx:ht0JYtfPf23YB7CUus-1aKr9jN0RJS3IyagTt_LLN8HjxXB97_XX6g>
    <xmx:ht0JYlVnNV8KJMfbmiKJ9apLIghyNPyrpjEb6lwYxSHSwf2Yj36NQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Feb 2022 23:41:42 -0500 (EST)
Subject: Re: [PATCH 1/5] dt-bindings: input: Add the PinePhone keyboard
 binding
To:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Olof Johansson <olof@lixom.net>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-2-samuel@sholland.org>
 <YgZjWh6dQQJEK21K@robh.at.kernel.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <49428899-5940-0e32-f29f-d8bc74ee7aff@sholland.org>
Date:   Sun, 13 Feb 2022 22:41:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <YgZjWh6dQQJEK21K@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/11/22 7:23 AM, Rob Herring wrote:
> On Sat, Jan 29, 2022 at 05:00:38PM -0600, Samuel Holland wrote:
>> Add devicetree support for the PinePhone keyboard case, which provides a
>> matrix keyboard interface and a proxied I2C bus.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  .../input/pine64,pinephone-keyboard.yaml      | 90 +++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
>> new file mode 100644
>> index 000000000000..00f084b263f0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/pine64,pinephone-keyboard.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Pine64 PinePhone keyboard device tree bindings
>> +
>> +maintainers:
>> +  - Samuel Holland <samuel@sholland.org>
>> +
>> +description:
>> +  A keyboard accessory is available for the Pine64 PinePhone and PinePhone Pro.
>> +  It connects via I2C, providing a raw scan matrix, a flashing interface, and a
>> +  subordinate I2C bus for communication with a battery charger IC.
>> +
>> +allOf:
>> +  - $ref: /schemas/input/matrix-keymap.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: pine64,pinephone-keyboard
>> +
>> +  reg:
>> +    const: 0x15
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  linux,fn-keymap:
> 
> This should be handled in a common way. Not sure if there's anything 
> existing for alternate key maps. Child nodes of alternate maps would 
> scale better than new property name for every alternate map. Or you 
> could make linux,keymap contain multiple maps (e.g. 2x XxY entries) 

matrix-keymap.yaml proposes doing exactly what I do here:

  Some users of this binding might choose to specify secondary keymaps for
  cases where there is a modifier key such as a Fn key. Proposed names
  for said properties are "linux,fn-keymap" or with another descriptive
  word for the modifier other from "Fn".

The only other reference to linux,fn-keymap is in the nvidia,tegra20-kbc
binding, even though that driver doesn't use this property. Instead, what the
tegra-kbc.c code does is double the number of rows to include the Fn layer:

   if (kbc->keymap_data && kbc->use_fn_map)
           keymap_rows *= 2;

(except that use_fn_map is set nowhere, so this is dead code). Using extra rows
for the Fn layer seems a bit magic to me, but if it is documented, I suppose it
is fine.

So there is not much in the way of prior art.

> Or if the map doesn't change, just put it in the driver.

The keys are removable, so technically it can change, but maybe that's better
handled by userspace than in the DTB? On the other hand, from Dmitry's comment,
it sounds like he would prefer leaving the map out of the driver.

Regards,
Samuel

>> +    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap
> 
> Referencing individual properties should be avoided.
> 
>> +    description: keymap used when the Fn key is pressed
>> +
>> +  wakeup-source: true
>> +
>> +  i2c-bus:
>> +    $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +dependencies:
>> +  linux,fn-keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
>> +  linux,keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      keyboard@15 {
>> +        compatible = "pine64,pinephone-keyboard";
>> +        reg = <0x15>;
>> +        interrupt-parent = <&r_pio>;
>> +        interrupts = <0 12 IRQ_TYPE_EDGE_FALLING>; /* PL12 */
>> +        keypad,num-rows = <6>;
>> +        keypad,num-columns = <12>;
>> +        linux,fn-keymap = <MATRIX_KEY(0,  0, KEY_FN_ESC)
>> +                           MATRIX_KEY(0,  1, KEY_F1)
>> +                           MATRIX_KEY(0,  2, KEY_F2)
>> +                           /* ... */
>> +                           MATRIX_KEY(5,  2, KEY_FN)
>> +                           MATRIX_KEY(5,  3, KEY_LEFTALT)
>> +                           MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
>> +        linux,keymap = <MATRIX_KEY(0,  0, KEY_ESC)
>> +                        MATRIX_KEY(0,  1, KEY_1)
>> +                        MATRIX_KEY(0,  2, KEY_2)
>> +                        /* ... */
>> +                        MATRIX_KEY(5,  2, KEY_FN)
>> +                        MATRIX_KEY(5,  3, KEY_LEFTALT)
>> +                        MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
>> +
>> +        i2c-bus {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          charger@75 {
>> +            reg = <0x75>;
>> +          };
>> +        };
>> +      };
>> +    };
>> -- 
>> 2.33.1
>>
>>

