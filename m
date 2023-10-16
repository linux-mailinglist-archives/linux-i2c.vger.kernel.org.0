Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6667CA09C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 09:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjJPHbj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 03:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJPHbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 03:31:38 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2125.outbound.protection.outlook.com [40.107.105.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E1EAD;
        Mon, 16 Oct 2023 00:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMXLDXudYfb6n9Vtn97peHR1Efu+EB4aEeyfjE7L6GOVjzBb64t63ywuHYaY0mFWmIcOH5dS92AnFkUm320fjAF0qwjc0ymaQmJPRiGdJ/WQfHYrvAKej87ROMALXfim+RGsmVzPU4kkKFSdR/47kuxfyrw3MH35pZg9QYiLRpONSddOItA+CZQAzR8b2wLW2kJ/X/jWk18hf1XJKoyA/xAfwqa7/uAnB1FxQYgyHnSdEL4heWoL+FZghV0GS5+2NkSPrRqrEdnGv+GqMPukbLpnF1jN8anIm1kncG0ykZqQPQ1GgQJwTvVuroHdDE+6hpexC+T32/BQ/RbTpzqrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02BMQMlf+LKzaWo1U27pWlYWveXPM//li/m6sBuVSPE=;
 b=i7g7CpKywGOprwyiX8iWz7819hFpHLUIc6cNWeejXyxTSE9j9NB7A5Qq5MBN3zRUVKXDqtu8nM34aD2Z1LPrXAmrJu8Tmuc4IrJf0k1a2iGRU7wZQRKZRS7zFZy8yWcysSjBGwWr7IJ1RyWzwS2kEUU+c9mctSGCWqYLDSXaXgHz75OY+tocCt7y8FyTcr9K5/FnmLKpKr1rEfjxh8PjJg0D46uEm8eqxCSWIamCZ5PlTyD0mujBa/VCEyWdFbS490kQIeYg0xl0Bkv8eCFXuLy2thvuSuMbrfsxV1A80kq/EMv6Tt4Vs3L3P61pqovKMsAytfC0VGK89u7tKBFQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02BMQMlf+LKzaWo1U27pWlYWveXPM//li/m6sBuVSPE=;
 b=eHl9xYPHgzyrGdnHJHdmwt3t1OCUvlPwnNPvqdK5kNbFqaqoc5/7cF/Mu5VG15bWC+W7au9rkjaFAvHPZ9KQS/Yq+hhI9xIWBywjkejI4WPIMvzknby1tLESYteIqebsNq+GN48t/FBqEBj1bnB6R5NtLa1iWCfrv5s6Gm1GjFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB10421.eurprd02.prod.outlook.com (2603:10a6:10:475::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 07:31:32 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:31:32 +0000
Message-ID: <1521fc33-d1a1-cee7-81b4-b7966c9cd4ac@axentia.se>
Date:   Mon, 16 Oct 2023 09:31:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Content-Language: sv-SE, en-US
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
 <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
 <63403365-2d23-b4a0-d869-070686d62ab5@axentia.se>
 <812dd506-c61b-4967-9b0b-ea35a111bc7f@alliedtelesis.co.nz>
 <20231013093407.p2oqsagk62vrqacc@zenone.zhora.eu>
 <21392d77-568c-4770-ac01-cfe3f93d424c@alliedtelesis.co.nz>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <21392d77-568c-4770-ac01-cfe3f93d424c@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0080.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::22) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DU0PR02MB10421:EE_
X-MS-Office365-Filtering-Correlation-Id: f132b30c-f5d4-4a59-78dc-08dbce19eb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tkyya9mgD9IoypLaNcRxjZ52tUqpBPx3VjHTJZpG9UELjCFJvYJetw1Nuo9vMJ54p/Lm9BXeL2yfwAudEh+PHSjlI9Xei43PX94A6khGNXAFSWuJbxje1dnkKJms3O/TXJXlqhT9QGoQJ/X5hDfQHkYVpdG48ehshx2ZpZAY1X59dANZ1LdTn78iK+H6HS+ewFY2tLUuS+MHM5nP4/xHDfxJbmLEEDpJYEfrjVyXnvqKWXnnsob4VINdM9hXo/C0QiiIaDXRo/cOiDl7d7yCLmft8vEUfsWK7T28TRS3LhOfZVXfE6FGNxVr/Mtztz3qp0VBCy+XxDyEOK53PjUt57RRTS/pAkeAPKvt8cvtD5t9lexV1zR90eI3qRsmnS59jVAhqODh8kNsnOpdcuh3q0oDsZu8F6+lLSoUVkqCu8EcWk+MCZ+HBgyd+VjtkIULQy8J5L0Cq1Xxh+/4Mr90W9bTGUqwFjvgl4EM4sLBrj1e+XCXrzeVf0Xv6uJRBFQOVRCCLhIkRwdItfUyXoHcxWVzmJIBBykhDIXnJ+5A/Wo7oPvO40cNfsZE7t1ZYHalaDm/8ck/P4TzufJ9ButiHB3F4yZbm/wkUri1sPbl2lCw+kdrGQVH6kacI+i4RWktrJ88DKKvovaYtuz6o9O/xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39830400003)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(110136005)(66946007)(54906003)(66476007)(66556008)(26005)(6506007)(53546011)(2616005)(6512007)(316002)(4001150100001)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9kd0pkeHFzeVdNK09wV09VQ1UxZ1hWcDJZV2RTcmU5VjVKZlFsOFl5QkRU?=
 =?utf-8?B?Q25XL2gvVjBrZ2c2R3B0N2JvdDVWRzBJa3cvN2czMytEdUF5TjFqNUNDdXZY?=
 =?utf-8?B?K1ZjRHBSMHNWMTl1RForSUNmcTZSUWpaUzJpWG5QckJPemdNYkd5SmxFbmtr?=
 =?utf-8?B?WVMvdkRPaDdacng2ZmppRHJPWVA3SFFPblcrYVhCTGFuMDQrREN6V09NWi9r?=
 =?utf-8?B?TllnSE40WmM0ckZLTEVPdndoNHJHZUFyYjc1SXdPamZXcXdsUnhJZzl0aUY5?=
 =?utf-8?B?WWQwTytvL1N6c2JwZE50Z3RqUC9OMHZQeEZTYXY4SnR0YmN0cjB2aTM3WUVY?=
 =?utf-8?B?ampkdlhFZ2JwRGtqT3RmM3lISnJXUHE4bzdhaWtWWjJwL2tjTzRXZ3V1dzVJ?=
 =?utf-8?B?OGxubG1OVmUxTndjSFBrbksxcDdDVE9lYzhhVmVFbjJOZXVvN1Y0SjNGeXhk?=
 =?utf-8?B?RGMvWmZiakVBTHczM1Y5UnF1cFNPdFl2MVBtV0haNlRaWW9qUStvdkhTVFZS?=
 =?utf-8?B?dE54Y1N3MlNzaEFXSGhucHpjWXBjejEvSGJoc2RJNm1wQkdlWWZjZEN2Wkp0?=
 =?utf-8?B?cFFmTC9NU3BEbDQySmRRbGFSdWlPRjJTMWZCSlpBSU5XU2x2TjdHUnhKR1dB?=
 =?utf-8?B?R3RlL3RDdkdZNnpVSURyZ1k3QUIyZXhObWw2NElvcFUzUWVha2pSK0Vqc2RO?=
 =?utf-8?B?OWc5aXdTVnVVUGUvU05iME5Kd0QvRlhMdnlOWERnOHhKSEE3blI0Mmw5SERn?=
 =?utf-8?B?VktJSmFyNnVxSm1xNDNHbHlIVkVuR0FETkQrYjdGRVR5cnV5bjVjUHJsejIr?=
 =?utf-8?B?d0tZZG1oZWgwWFRTaTJISk0zRUxLRFlVSXNTRDNQY1JKcE9VUHZvYTdmcXRx?=
 =?utf-8?B?NS9ESEFRYUdHR3hLNk9vb1U4N2lMVHlrMU9YQ0E3NENmWGY4bXRreE5LdlJs?=
 =?utf-8?B?OEoxVEN1dHh2TTVrMFgzTkFCbTJCWWRNTnViNzJqbzJlcXAvaFlHcmM4a3Rh?=
 =?utf-8?B?RDdhSVNIc1dsYVRaMHlUc3ArcGNWVlhtY2xxUU4xeFhzWjN6VnhaakdRTjRL?=
 =?utf-8?B?NEJDS01PN3RjOGhNMDFkUXAxUnlzSkNsclJVOHU5bHoyc3dQS0xjems1djJj?=
 =?utf-8?B?MERhQy9oNXlXUU51OVB3a3NNVko3cDBNZDkyNnRWV2pEN0JBci8zajhmYzlO?=
 =?utf-8?B?Vm1UTFVMWUVuQkpWaTlKN1IxZjBlcVNTUHdqdlZ5TlY0ZFFyd24zYU12Z0dU?=
 =?utf-8?B?cFNnbGgxVzIrb2daYVFoOHF5L2I5K3ZGbEdzcjM4QTBQSlNmR0h6cHRHQnM1?=
 =?utf-8?B?UzBQRW4ybDBucUsycVdsN1FpOEo3cU54SUlQVUwzbUdPUmV6UnBFQlhtVVds?=
 =?utf-8?B?VjFLbFhQbmV2OFVyVURBazJKWmI1bFBaTUoxZ1FmNHN0MjVrRHZVcytIVXBM?=
 =?utf-8?B?UWRqYm5NZlBjN3pmbURMUkxLMVJGbFFoL08xMWVCbGlnZyt4dTVTUWJ4czFu?=
 =?utf-8?B?dHJEZXN6YmI3SUdaaVcvWXk4eXlnRGs4cFhhcGhtSzhPWXlkM29IRzIxUDZS?=
 =?utf-8?B?UW9qdnJvTFNzaE5kRUptSGtiTWlmZ21STnlCRmtkK0FER01rTEpHNGNnWVBI?=
 =?utf-8?B?WTdjRjFFM3VEdHZFVVNxaUgvQ2ZHbVozYzhJZ1BXSDcwUzJiNjFwVlZHbXhW?=
 =?utf-8?B?QTZNeWIvd2IxTFU3NStCcUhOUkxxQ3pkU0JyKzlBR1VGM2ZFSit0K1VvRzEw?=
 =?utf-8?B?R0dYMmtGd0NLRmxJNUl2Tk1uWlcyeXVydVVEYzl4SUQ1VUFKeUx3V24yLzYy?=
 =?utf-8?B?NllObDlKSE1WUWNUdjhsUVdxbWk4RFBXc2VkWjl1WmdqMnF1VkxpaUtHOFVa?=
 =?utf-8?B?WHRMbllsQldkTTUwd29CSTRjM28zWktKVzNxWlRodjIwdEVlUG40TDlTTUxj?=
 =?utf-8?B?MXZITm9LUC9WbVBZUXo0d20rM2k4L0lsdE9PajdmRHFONVdNZFhRUFpEcGE3?=
 =?utf-8?B?UFQ1KytvQ0t0TzdEV3BtNE9jUE5lSXVWRTYvWVgvTzUxTmhtTVpFM1ltT0Jo?=
 =?utf-8?B?WW5jNzZxUlA0NUsvMGNGVnpWQlFSNDg2OE9wYXBLWGYwZGhsbEpvT1RZWTNw?=
 =?utf-8?Q?GKV3K9j3G3uW5kGORookttlSl?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f132b30c-f5d4-4a59-78dc-08dbce19eb9e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:31:32.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE1iTGEu+Cy3gCMRU2y1oYhifqeyDXEwLpZFmXcMIqK2i+EkfDJOelv8qvHp5VfB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10421
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-15 at 22:20, Chris Packham wrote:
> 
> On 13/10/23 22:34, Andi Shyti wrote:
>> Hi Chris,
>>
>> ...
>>
>>>               static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
>>>              @@ -1083,6 +1084,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>>>                      if (drv_data->irq < 0)
>>>                              return drv_data->irq;
>>>
>>>              +       drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
>>>              +       if (IS_ERR(drv_data->reset_gpio))
>>>              +               return PTR_ERR(drv_data->reset_gpio);
>>>
>>>          if this optional why are we returning in case of error?
>>>
>>> gpiod_get_optional() will return NULL if the property is not present. The main
>>> error I care about here is -EPROBE_DEFER but I figure other errors are also
>>> relevant. This same kind of pattern is used in other drivers.
>> we already discussed about this, I don't have a strong opinion,
>> you can leave it as it is... I recon this is a matter of pure
>> taste.
> 
> I think in this case it would actually make things uglier because I'd 
> have to check for -EPROBE_DEFER. So something like
> 
>      drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", 
> GPIOD_OUT_HIGH);
>      if (IS_ERR(drv_data->reset_gpio) && PTR_ERR(drv_data->reset_gpio) 
> == -EPROBE_DEFER)
>          return PTR_ERR(drv_data->reset_gpio);
>      else
>          drv_data->reset_gpio = NULL;
> 
> I could probably come up with something less ugly with a local variable 
> or two but nothing as tidy as just returning on error.

I disagree with this, in my opinion it should just be:

      drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
      if (IS_ERR(drv_data->reset_gpio))
          return dev_err_probe(&pd->dev, PTR_ERR(drv_data->reset_gpio), ...);

My take is that optional gpios (or whatever) are optional because it is
optional to specify them in the devicetree (or whereever), but if the
optional item is indeed specified, it is just like any other error if
it is not working.

$0.02

Cheers,
Peter

>>
>> Would you just mind adding an error message using
>> dev_err_probe()?
> 
> Yep sure. Will include in the next round.
> 
