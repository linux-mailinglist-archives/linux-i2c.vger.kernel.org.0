Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737897C4F62
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjJKJuT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 05:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjJKJuS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 05:50:18 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2078.outbound.protection.outlook.com [40.107.8.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAD392;
        Wed, 11 Oct 2023 02:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTmvB3BDXDKSvMi82MaNKUKwOpRbxBC0rAub1HY2dmyjpH0jCd2BuHi0p+8zsiMwHIrsoz7uYwqUuxcmRmBTjZVjJXI1sZd3YOAeA3BJ9Y0gDTtgbLnvJfrQRiphjRgt3Tx8XwGAhWNpK0f5fqC/j2tYOWShHtynJxN2i+1fNVZvYCxQvIDQin7nQxB63xm9S7POwgZxEFt78FQhYNR6ssd+pYcHrGrdzZO4iVNOm0gfqP1MYHHZvWEtW8wdR60pnDs2AKUXCJRmuW7MCouISvuiE9dtWrUkLtc32CiYAA4gmqwzGCghIu/WzXjsMiASDhfMATN4fOgk7B808YwgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVn5uaxeH7vCWPnlx64YI5wdaFHQH4MIJnpxcz7c1vA=;
 b=fUiWF2MPON3SnlJdJWmY2zLt+Rk4e9Fsx7CZzMYX8pdvsPFEWUvhp0d5qyCwmHWGgPUk+y4n5qvc8EP+rJDZfvNvnHtKR+wuParoFBJn3FQL5EarDYlN2pmsLtm0J/a5/MX52D3qHQdYPWBOvAtQM4054FEgcqk8sVLNZ/vxKTK400fBP+PgtUZ9GiUMq3i6oVJJ2Wh8EPVZtkF8+8qAd6uC6V1AmZMc9svNIoirBFqyuMDu8uMAHttm5kf08h3N+TXdwMskKOxHuG9PceDhdr3UffIx+/0KfrmppuZ9lEI4XYczRIiSANPXRaDloHvFB0ul6A66pYLlrrrUMAKDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVn5uaxeH7vCWPnlx64YI5wdaFHQH4MIJnpxcz7c1vA=;
 b=xZYfBAK0efCaOLJfB3ZWk+4WJPYKlKf6A4vlGCXtDCMk6H/a+ETGDPPwdiWYe9yBbYsqzH2tp91EL7uG5A6O38l7flQ0Tb2iH6jUWZNmg/txzkG7RgWlfD+CNboTukQnKilvjJ/VVzcOnWG966Nqz7p7jptBvkLnW4KMF4dy0iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by DB9P193MB1786.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:245::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 09:50:13 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7%3]) with mapi id 15.20.6863.041; Wed, 11 Oct 2023
 09:50:13 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     linux-media <linux-media@vger.kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>
Subject: Re: Sony IMX290/462 image sensors I2C xfer peculiarity
References: <m3y1gpw8ri.fsf@t19.piap.pl>
        <CAPY8ntASwh3AcRqE+2zF4Df=u+=wJ5K9icAeOrXTMJGDd1+caw@mail.gmail.com>
        <m3o7hfx3ob.fsf@t19.piap.pl> <m37cnuvmhn.fsf@t19.piap.pl>
        <m3o7h5tthf.fsf@t19.piap.pl>
Date:   Wed, 11 Oct 2023 11:50:12 +0200
In-Reply-To: <m3o7h5tthf.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
        "Wed, 11 Oct 2023 11:10:20 +0200")
Message-ID: <m3jzrttrmz.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|DB9P193MB1786:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c7f55f-255e-417c-35ad-08dbca3f772f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCmcOFtecOtFRbz9SXcBFYsdk8eS5C8nMHjptOzorgdzlSbDQ3N4gS5Usrwz6j8G3r2cQPWC8/IAEsjCKqk+4Z89ZgLCAsQtJH24kN4K/mWjVbfJfX+6nKjBVh1OMy4lFuIzem1s+MAabWB1/J53dfkKAzK8WEN/GY5yD1CkfkzcRd1RV/TM8h88Ja2LEexJA/B+HdEAe842UjJO0KBgll8ZVYhJNMqfglRzBZo5hj/jVUnZ50mVaIMoJPlRGxmV+5cT/HE6T9mJcHbcfC82VjXEFd6z7vzt07HDm3wJz7L6jDqVhok6CLB8tbkweXxUvRm2BsOTigPAG9BuMc5HxltdsuXhFckHybIvTI6dpq0Ht7gJVpbHksVauWYo3vCbJ0QjhBK9ZIvOTtABpZVsvYF946OIq+1zVIrp6krAxFOuVP0CwfxDsMRWy7BWwlhODgx7FU8/XcH5x12LxNqRbu/jAGrZpjoKE4F1U59ByTxKNVynamJSdkj58RyoC7rj478ctCk/8jdstdCxrse0Z/I3rVkfYBo5EcHzavwn1ERcrRt/mczcXF2VW90PrHavJj8wSpKAhO1TEDblYy2vatCQMfZA3xBzgXmH+mam9SMk0sLqqpLv3UQlV8KpwSvI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(346002)(396003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(478600001)(66946007)(66556008)(66476007)(6506007)(52116002)(6512007)(6916009)(316002)(54906003)(786003)(5660300002)(26005)(6486002)(8676002)(8936002)(66574015)(4326008)(42882007)(7416002)(2906002)(83170400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWE3SHBsSW5xYmRmVndIc0cvdG94M1JHM0pGSjg0SzZUeitzSStoTGRZU2FE?=
 =?utf-8?B?cDZ4N0x0WnlvR2tOU3pHNlE5TnRiY2MyMUVtN0lMaUlVc2tldUVyU2xlUWs4?=
 =?utf-8?B?SjJnSGN2V1FOUXdNTVptN29ZSHFUaGxqZ1JHQmtBZFk2N0VJS0cxUHFwRVlk?=
 =?utf-8?B?KzU0NGUxOThoeHZvd2laZnhtWGdrNlFuV00yNXc4dFU5cG1kaVdHT2pZODkx?=
 =?utf-8?B?NHAxRzZ6RHN5UThjMlZ0RlU1YmNvdjBVRGxPL20xT3Y0N1hqaDNLYUw4dlF2?=
 =?utf-8?B?T3huc3llMEVGWitHMmxmcmtpdnhMSHpvRkpmL1BtRFRNQU1FNGdXT1p6M1BT?=
 =?utf-8?B?anljYXlVQWhqN29CK3AxdzI0cXBWdlBoRFJJRitHUk14U2JUdTRad3dPK3ds?=
 =?utf-8?B?VkxBUFJiN1B2K1BwckxEYmJLVVlQK1dXdnNBNGRNZ0hJMmk5Vy9mMWFsNHBp?=
 =?utf-8?B?TG1SbzNFSmErQ1pzSDVISjM5N0lraHRiNEZLRThUVUo0anBGdE9YSXUvalBt?=
 =?utf-8?B?ZFV1Z2wrbEcvQUt0Ym15TDRtK1lKNmszaVZVc2RqWFJ4ZjJkazdRSkp1Sm5U?=
 =?utf-8?B?MzhUQ21COE8zbGxXcGtHT09BQWZnZGhjTVJLWmh4dXhnT3ZyVHVidnI2aFJL?=
 =?utf-8?B?VEdjS29lRjZacFNGQjJNbi9tRW5xZC9vdnEwdGhKWllxVzkxcnl0K2o1czha?=
 =?utf-8?B?S0NGcnRLYWRFU1U3OGJiTUsyZEdNcVZIKzhXUEk5WHlBbjBOcFRZUHJZK2k0?=
 =?utf-8?B?RFUrancrM21yM01OdWpJcUoraUdzVUI3bXdOc0w1SElBTk9IRjY5a3cvc1lQ?=
 =?utf-8?B?UDJvZllaRUxjTngxTERvVElveGRycEV2VnVBL2FIQVAwaUdGS1V2MW9xaUtn?=
 =?utf-8?B?Qk5yM3BmR0ZyVExmN3NDRGNlalE0S1dEcEMzL25Mb21FNTJBaE53QnVCSFNF?=
 =?utf-8?B?YWtKWk14V3NwbTlUTUxZdXhoSmgwTSs1OW01WjgyNUJPVXNCeUFRdi9Tdmxs?=
 =?utf-8?B?ODNxWUxRQnJuZkMzQ3RSKzNwa0h2T1lMTnhNTmlnVWNqWWZDS0V4bzllN0Za?=
 =?utf-8?B?VEl0Q0s2ak1GblAxY1VUQ3VOd1BLL0l5MVdqRTBMZTcyckl1STZySHNlTzhG?=
 =?utf-8?B?eDYybVpBaC82ZEhmQXUyaWFwSkVEemRxVHFpZFBYZG1pL243bW9TUnFzRGFN?=
 =?utf-8?B?bVp4V05pZm1PU2tFdTI1WTV6WDJpZVNKK3NCSzNqQnd0TEpjdWlhcm0yQWpV?=
 =?utf-8?B?U1ZwOTVpQVlmZUQxbGd1RndsSWdDcWZ1bkYweHR0b2hmT0wwK1RPcW5wSnQw?=
 =?utf-8?B?ZHlCNTVXTWdTbDRCWWlTVStOQ1BWU1FadEVMekFaRDZlWitYV2pheW1ac0M2?=
 =?utf-8?B?YzUyMTlBaE1SQ2t2Q05mZk5lQ3pUZ3FESFVObzZhSXFYVG0wRkxLL2o2S3lm?=
 =?utf-8?B?RS9qZ1JKNjNtaU5TRlJRcUh6TVNGZWNOSDFlWk5MVzRmNlFlMjVkTnhvL1RD?=
 =?utf-8?B?MlZoUGg4bjZKVXRubHRSOS9SeTNYTXZPVERkbWdqS3B2SEo4c0xzU1c4cncy?=
 =?utf-8?B?Nm5jQitPSHZsVlB0OEYvSGJ3aWg2aDNVL1JuZEZtaElzcTcxcUk4OWM0TUlC?=
 =?utf-8?B?bDAvQ0loTHRmekp1cjRMdXErUXk2TXpCNHJMV1orb1FjNUxOclh1NW51L0xN?=
 =?utf-8?B?ZHZBLzNJMFRBaS83K3I1YmxMMENmVkJnNDdmQUptVkpHOUlTZEdINHNMbE04?=
 =?utf-8?B?SHNYaFJIVGFXbFo2dVZKbGUvd2IxYncyYktvK1FWZjFBREhPeGgzNnVnTjNn?=
 =?utf-8?B?dVA5TXVpTFBIRXdFN1NSY3FOenJ4MzBlMy9nSmc0QWh6YlcwOGR6RG5RbWUv?=
 =?utf-8?B?NzMwSWpBVlI3eUhSYnE4bFFnRUg0ZndPZFNVcjBKdGFtMjNLZkJzSlZseHRr?=
 =?utf-8?B?SVhaRWNuNDZrUG9qQjVQRlRkVTVTYUxVTmxPMTVoVDhxRWtjMUtUeGI4Q25p?=
 =?utf-8?B?Sk9XaWkrUXlFNk96WWxhL2puOUZPOGJ5elNsREJGZzdsajB0SGRvRlhTWHVZ?=
 =?utf-8?B?bno5WE82VmU2b1FkaGllMFhCQUFkckx2MTJIaU9rKzl4bUJtWFEwVjBNS2Jh?=
 =?utf-8?B?d1JwbE9mQWdRWnpQaEQrVkJ0MWVzVmhqV091VVExM2ExSU53VzJuOGhhUWRZ?=
 =?utf-8?Q?0bFmZCv+5eaPToxiQjboKiSM/wAN+MCrje326Ja+Snom?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c7f55f-255e-417c-35ad-08dbca3f772f
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 09:50:13.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PugwjyxbieOahBy/r2pqs+wGiOkVpSblbV0DEsLUI0C6aP+jNacgOGYpAwt1FY4L9o7z/6yhP5Ck8fDrT33eAvAnUkzeLPBMjfacZMIWMTYJ/Ft1YZ7R96cTU2dALLRih1bzuoyHt1wTJzQVXkV0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P193MB1786
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

adding more people to Cc: as this is more general stuff than my specific
image sensor setup.

Is there any reason for the following (meta) patch to not be applied?

Currently, every i.MX8MP atomic I2C transfer starts with 100 us delay
(just after the START condition). At 400 kHz bus (384 kHz or whatever),
this is equivalent to several tens of bits. Is this delay needed?

This is on NXP 5.15 branch, but it seems the mainline is identical here.

With this patch, the 1-byte (quasi) atomic image sensor register reads
(16-bit address + 8-bit value) are down to ca. 160 us, and writes take
120 us.

It seems one bit on the bus takes ca. 2.66 us (hardware), and the delay
between consecutive bytes is ca. 4.82 us (I guess CPU takes a fair share
of this). This is i.MX8MP @ apparently 1200 MHz (1600 MHz with freq
scaler).

Fire away.
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -534,xx +534,xx @@
 static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, =
bool atomic)
 {
     unsigned long orig_jiffies =3D jiffies;
     unsigned int temp;
=20
     while (1) {
         temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
=20
         /* check for arbitration lost */
         if (temp & I2SR_IAL) {
             i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
             return -EAGAIN;
         }
=20
         if (for_busy && (temp & I2SR_IBB)) {
             i2c_imx->stopped =3D 0;
             break;
         }
         if (!for_busy && !(temp & I2SR_IBB)) {
             i2c_imx->stopped =3D 1;
             break;
         }
         if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
             dev_dbg(&i2c_imx->adapter.dev,
                 "<%s> I2C bus is busy\n", __func__);
             return -ETIMEDOUT;
         }
         if (atomic)
-            udelay(100);
+            udelay(1);
         else
             schedule();
     }
=20
     return 0;
 }
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
