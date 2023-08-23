Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EB9785B53
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 17:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236739AbjHWPA0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 11:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbjHWPA0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 11:00:26 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8340AFB
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 08:00:19 -0700 (PDT)
Received: from localhost (fx601.security-mail.net [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id AF03F349E82
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 17:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692802817;
        bh=S4NY5pF3ORxtf9e+27QuSQA2824zb1+xFQjONrkeCeE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Oz9dnxWAFA1HUKVai7WGFlHjvgGzsiA/3AldMeMebVrnhBpJFb6NAqUPvb6dgs2Q1
         3cRBm8KSWcHdUzJdrrE1j3BgvNK9Q9kQLP/d6r6L1wwfCe0ty8c719CvfWxS1MokRn
         EwfSZZe2XhRqd5g38odWMSqJ5Eaw7fd1zAlVseJY=
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id 817AD349E73; Wed, 23 Aug
 2023 17:00:17 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01lp0109.outbound.protection.outlook.com [104.47.24.109]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 5BCAF349E99; Wed, 23 Aug
 2023 17:00:14 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PAZP264MB3008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 15:00:13 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.026; Wed, 23 Aug
 2023 15:00:13 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <18680.64e61efe.5addb.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXloR0BNx0+F0BfMhm9haNjVYMRMIzJgR19u+DPbbtSNec183Y61Kqnu3GSTCQPr03OH72QEQeVRWBYbGExfjEOgJzZ9ZVD/a6UWffWWfdVWXjGZyLbRywzub1k01LoJ/EXWED5OQc7gmb6qG92g/R2ufBdUnFUjzTJqdoRVzPiptAA+6nQkGCbRTQYOWuWPkO6Xf92dgrsCK2XR9YP7H/wEIroxuSVPJNzLTYQAG5L1zfEJI8xEm3t+CsQns/6OHhlRZvNbdCH0GErPFXFTNd1wojyr0K6DKvtIYK3iZUuuhI7TnBKS3odc/7xAApFbm0x5cE5czv/OAbn0ii0nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp/N547yXh4TkFZ40HYZ2k4zMCMUrphLcEOgslft6KE=;
 b=YpllaV9CMCKnpfxzcJLA0+IAad8Jkdqm0GYPmYNwtGXDRkijtMLJLJ5CsgYPd8/atO8Cnbg+MmSRYd9giYaO0auwJj3Ba9TNPlWS5nCTVr5QgQGMKf9r/dJYm3yA9/wU5yfWbp6Lsly43kZ4oG51+tbeJH/WxSRy4BUEKu13fN8Q1NuzxV5uazKIcSpVXP14G68ZIZkvXU+kHHMLvXiJpUwpxpKllsRy5GCsDhznYDdlaRQmu3Ckb/pnj9UQl9KEvSinrN4DcRm6OttLr/CobYe+aq9+jaGJw049RL+BFY9QX0FnBb2tZxW8MHVQmx40BjkBrlofyCe0OVh0MfzUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp/N547yXh4TkFZ40HYZ2k4zMCMUrphLcEOgslft6KE=;
 b=usL9H5uBPXXgoWy0Nk9Vkk75+NLWbDzNs0xThComd19T9qjsj5nizjKbz//f9gtv0KlIuETpSN5LwSes7z3ytX4r/iaP43FR2yxInsaiy5GGnQEvDFOJwqhmZamuRnT5DEjj5h+cYyHpTuJnadVt8te9tRxwhlYSTRLN1KgABcwwswPUoa3dOajMHMHQlg7dEA4d/O0iphNGXl4xjuQVnWqKdpLHqd5vAXuGsCwzQ6vdztA1grToVLX25k0s05B8qAz8TV/OapeG8pxhBj/GSVLIZLk+efOzW8qwZUp1wH2brP6bHUbmv+/KYtx93pq3LK6J+/VYaO2gb9T020yKig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <d3d8446d-dbc9-0084-d930-0af1ec7d6b70@kalrayinc.com>
Date:   Wed, 23 Aug 2023 17:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH i2c-mux-next 1/1] i2c: mux: Add register map based mux
 driver
To:     Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se
Cc:     linux-i2c@vger.kernel.org
References: <20230823144127.7885-1-vadimp@nvidia.com>
 <20230823144127.7885-2-vadimp@nvidia.com>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <20230823144127.7885-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::17) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PAZP264MB3008:EE_
X-MS-Office365-Filtering-Correlation-Id: c583087a-97df-4c9e-7339-08dba3e9a717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50et1YdTGuxAdgulSGYT64fwFfdMmqoS/5U4XJOpeLH+scld34zWX0C2nk3Mb2j6uDDG+IUQxTVrfR355i7VMSyaNaspR5LtnMqIXXPr8vg13ocnFy75gyQDlq4fdEIddOl6BBbhbUkBbtcsNuaSOuUeKrwP7tdED/y4fQ7XNZz1RdOXkY3EqBhQVSd8SmfU51/ZR3g9gY/rFXvLFDw8dc6dAD6XG1Mnr0CzD64brAbcfjMMUrRpiwycHmEPhTho4EV+EBJ1cYB2doo0+i444PMOzagPBSnDxzbbgLFu7lJ7J/VCuRuO1fyN5ZjXx0ZvLN4Kh0eTt8cWPRHxRy7NTLtCf+vUDhNMu4NGlXkHD7Nrwj4q81VfRLCaRrs90Kxtl8p4T3Ie2QNRZaCg7S9+Nc7C9xchBkMnjnb7d0y4A7OIAgD1c9LB2jXb+Cil7leq0NTG9KX/5aU8OwhoKbdHARSb0C5qWBaMfgCbI983hrIGsUxVlfeHii1hDLXQNHZxkzZUQxJMKQyTpuiQoFVREIB7R2jXToG7PnMKQrBeWxMdRFleGoYBzGb/ypEMOKpqsxLj09EZ2OU+bXgbcgtqa0VathcLpr+6mUkWB+a6QzWCkNG6q29pEXvxBUwG4gwPnNs8WmgwojNJWGnlgopJKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(1800799009)(186009)(451199024)(83380400001)(30864003)(36756003)(2906002)(38100700002)(86362001)(31696002)(6512007)(41300700001)(66476007)(66556008)(66946007)(6506007)(6486002)(316002)(53546011)(2616005)(8936002)(4326008)(8676002)(478600001)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LeLKnDkyvQsZpKbB9h/rbfNFBf4QrniAiV+7O9Tl9KizSZFDmRkJbaQzvmL/Opkeo7vbjlI8P7VyDsX4DPKIi8JuRTfBbNucKQx06qsi6cvm6MbVxNfI2tmtON9hd3RmVTk9ijUmBzHuXvE/DqjfiIt5xyjY1kIXdRZKZcYzxlsMG0sntdijo0I5+I+HTrcJC5HWlJ23MGko8i0NLNAH++kQAtMP2mHIWMglIP1HSPzcMdCvHxH0Z7mcQf8Bf3SOzeEMeCjpiAheNVPl46RlzVaSFQLW/OxZhDLeUGVWRUmkluynX1sl/Do4e/D7RYnqmu4Vn2E/sklHaQookKjm2/xg6FTdpSfsM21IRLE+xvFUDoEmrY3EG/c/WeNbqEdkvJfXi0H1w9md1H06eQdsoxROWLFX7d0obHSQA6sobuS4/vGIU824SevnpFpEe0JvT7CbCmZlkB3JVAPJq0GMexhzoQtoR3+N9lk2D1w5EUnVb683y2vMJfFijXvBxLaJ4HYXGmK3X5eSeYnicurBGug1uWbMa1vrFD27sF9ouc7TeNtmBkaa639BDEd+23forIpDM2tQ0Pr07AgMoYIqKywnz4mvG/Fc7hi9dYIEKwMclcGXusXmUkDdz74d75btirBdEWM8/yFJyfBvReenRnWUjphDUGth9DHdmaq54sAqiHMHo5Es8WDY/00jfgkT3dFxEcSgH2zhFuiiy9Wa/oZ+C5VeOXHF5Zg+E5dGNNaJs2EwLNkrIKnqUeumw+xXlen6ee4Ay2yba8a6GcMcSaDu6IqPVMoYF4RUkNuef7ByS2i7T0V6UDvE1BnipCucpFHsP1Byeb0HC/hxXrEEb3e+rMTQqaPSSUYX2xcIlGoMRBc3rekQ52528Bipqqn4QdLHrciB7gyIir+2LL88nuaJzlLlrgZun0va3Q6zNSMEfgzI5elCTjrRpfX8bg5v
 lZBT9nyKbhN137YRmHycbSDa4L9JFYuuxbKjF2CxF4PYOdOUlFh1IDnjpW5V0H1OKREPEawGKxOJqaYhV/b/QDVUqehjXe8Ze6O8ffEiStlrYWLRwXKSLrrjYmgCI5GEVQZ5okWBOjJqoucmDRR/GCtQnFmaL0weGgXSjz/X80tNWSfDl2TW9xg/IyebUud441MaTglbifshg3BGvDKx1aUX6rCzHosC7R5PBeans7+5pmnRNi+jxv4/NJ4XNxOylMQBrfrXyC/JjRykiiKe/8u0C/0zrNAaIY8qbDa0NCD2lO5n1RsshbVKZgtTamhCp8OyvbgVj8juApud0v9p3KBY5WX0CHFpnjhikr644rmO6dU+yE84xB0+8lIfCWJVwysVRteYcNX6O3WMpPLVsfo9RFf5bjTAJVgg7TOaZ01JcKpZVl7DrhdEr4prBwslB0uc7jycNnphSba5hBZ9oPZX4b2WeZwfD1BO287NEUyJb057vZPPmG+ufbhkCkenLWqA6BKUmSXriN3vaGm+xQJPjn6yb9VkaJeAUesUYCe+D3cecXw3BQE6HEPvY/7Xs5dhzhO92A0j9brjpzqwhBECNrh9suWNLrmIzotz3MKC22+CiQ33zZS/G1FQzRa4DzNGGcCW5j55JXvDT33iXZdSawHQf2eutPCNaKk2ZmPLOqQfCzCd51G3YfwusXsr
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c583087a-97df-4c9e-7339-08dba3e9a717
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:00:13.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdNLFAUcE/AIPwpJiZdWtJ0CA1XP2pW/N/c5wNRP1zht1UiHbTkaJ4a7a1vbuf2pAxe5hF/OTGChoxc22ahk2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3008
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,T_SPF_TEMPERROR,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 23/08/2023 16:41, Vadim Pasternak wrote:
> Add 'regmap' mux driver to allow virtual bus switching by setting a
> single selector register.
> The 'regmap' is supposed to be passed to driver within a platform data
> by parent platform driver.
>
> The register can be on type of bus or mapped memory, supported by
> 'regmap' infrastructure.
>
> Motivation is to support indirect access to register space.
> For example, Lattice FPGA LFD2NX-40 device, being connected through
> PCIe bus provides SPI or LPC bus logic through PCIe-to-SPI or
> PCIe-to-LPC bridging. Thus, FPGA operates as host controller and some
> slave devices can be connected to it. For example:
> CPU (PCIe) -> FPGA (PCIe-to-SPI bridge) -> CPLD or another FPGA
> CPU (PCIe) -> FPGA (PCIe-to-LPC bridge) -> CPLD or another FPGA
> where 1-st FPGA connected to PCIe is located on carrier board, while
> 2-nd programming logic device is located on some switch board and
> cannot be connected to CPU PCIe root complex.
>
> In case mux selector register is located within the 2-nd device, SPI or
> LPC transaction is prepared sent by indirect access, through some
> pre-defined protocol.
> To support such protocol reg_read()/reg_write() callbacks are provided
> to 'regmap' object and these callback implements required indirect
> access.
> Thus, 'regmap' performs all hardware specific access making it
> transparent to the mux driver.
>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>   Documentation/i2c/muxes/i2c-mux-regmap.rst   | 168 +++++++++++++++++++
>   drivers/i2c/muxes/Kconfig                    |  12 ++
>   drivers/i2c/muxes/Makefile                   |   1 +
>   drivers/i2c/muxes/i2c-mux-regmap.c           | 127 ++++++++++++++
>   include/linux/platform_data/i2c-mux-regmap.h |  34 ++++
>   5 files changed, 342 insertions(+)
>   create mode 100644 Documentation/i2c/muxes/i2c-mux-regmap.rst
>   create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
>   create mode 100644 include/linux/platform_data/i2c-mux-regmap.h
>
> diff --git a/Documentation/i2c/muxes/i2c-mux-regmap.rst b/Documentation/i2c/muxes/i2c-mux-regmap.rst
> new file mode 100644
> index 000000000000..b062c1c5c02c
> --- /dev/null
> +++ b/Documentation/i2c/muxes/i2c-mux-regmap.rst
> @@ -0,0 +1,168 @@
> +.. SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> +============================
> +Kernel driver i2c-mux-regmap
> +============================
> +
> +Author: Vadim Pasternak <vadimp@nvidia.com>
> +
> +Description
> +-----------
> +
> +i2c-mux-regmap is an i2c mux driver providing access to I2C bus segments
> +from a master I2C bus and a hardware MUX controlled through FPGA device
> +with indirect access to register space.
> +
> +For example, Lattice FPGA LFD2NX-40 device, being connected through PCIe
> +bus provides SPI or LPC logic through PCIe-to-SPI or PCIe-to-LPC
> +bridging.
> +Thus, FPGA operates as host controller and some slave devices can be
> +connected to it. For example:
> +- CPU (PCIe) -> FPGA (PCIe-to-SPI bridge) -> CPLD or another FPGA
> +- CPU (PCIe) -> FPGA (PCIe-to-LPC bridge) -> CPLD or another FPGA
> +where 1-st FPGA connected to PCIe is located on carrier board, while 2-nd
> +programming logic device is located on some switch board and cannot be
> +connected to CPU PCIe root complex.
> +
> +E.G.::
> + ------------------------    ---------------------------------------
> +|  COME board            |  |  Switch board                         |
> +|                        |  |                                       |
> +|  -----        ------   |  |   -------     Bus channel 1           |
> +| |     |      |      |  |  |  |       |  *-------------->          |
> +| | CPU |      | FPGA |------->| CPLD  |  |                         |
> +| |     | PCIe |      |  LPC   |  ---  |  | Bus channel 2           |
> +| |     |------|      |  |  |  | |MUX|--->*-------------->  Devices |
> +| |     |      |      |  |  |  | |REG| |  |                         |
> +| |     |      |      |  |  |  |  ---  |  | Bus channel n           |
> +| |     |      |      |  |  |  |       |  *-------------->          |
> +|  -----        ------   |  |   -------                             |
> +|                        |  |                                       |
> + ------------------------    ---------------------------------------
> +
> +SCL/SDA of the master I2C bus is multiplexed to bus segment 1..n
> +according to the settings of the MUX REG or REGS.
> +
> +Access to MUX selector registers is performed through the 'regmap' object,
> +which provides read and write methods, implementing protocol for indirect
> +access.
> +
> +Usage
> +-----
> +
> +i2c-mux-regmap uses the platform bus, so it is necessary to provide a struct
> +platform_device with the platform_data pointing to a struct
> +i2c_mux_regmap_platform_data with:
> +- The I2C adapter number of the master bus.
> +- Channels array and the number of bus channels to create.
> +- MUX select register offset in programming logic device space for bus
> +  selection/deselection control.
> +- Optional callback to notify caller when all the adapters are created and
> +  handle to be passed to callback.
> +See include/linux/platform_data/i2c-mux-regmap.h for details.
> +
> +Device Registration example
> +---------------------------
> +
> +   /* Channels vector for regmap mux. */
> +   static int regmap_mux_chan[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
> +
> +   /* Platform regmap mux data */
> +   static struct i2c_mux_regmap_platform_data regmap_mux_data[] = {
> +	{
> +		.parent = 1,
> +		.chan_ids = regmap_mux_chan,
> +		.num_adaps = ARRAY_SIZE(regmap_mux_chan),
> +		.sel_reg_addr = 0xdb,
> +	},
> +	{
> +		.parent = 1,
> +		.chan_ids = regmap_mux_chan,
> +		.num_adaps = ARRAY_SIZE(regmap_mux_chan),
> +		.sel_reg_addr = 0xda,
> +	},
> +   };
> +
> +  Create regmap object.
> +
> +  struct caller_regmap_context {
> +	void __iomem *base;
> +  };
> +
> +  /* Read callback for indirect register map access */
> +  static int fpga_reg_read(void *context, unsigned int reg, unsigned int *val)
> +  {
> +	/* Verify there is no pending transactions */
> +	/* Set address in register space */
> +	/* Activate read operation */
> +	/* Verify transaction completion */
> +	/* Read data */
> +  }
> +
> +  /* Write callback for indirect register map access */
> +  static int reg_write(void *context, unsigned int reg, unsigned int val)
> +  {
> +	/* Verify there is no pending transactions */
Typo: "*are* no ... translationS" ?
> +	/* Set address in register space */
> +	/* Set data to be written */
> +	/* Activate write operation */
> +	/* Verify transaction completion */
> +  }
> +
> +  static struct caller_regmap_context caller_regmap_ctx;
> +
> +  static const struct regmap_config fpga_regmap_config = {
> +	.reg_bits = 9,
> +	.val_bits = 8,
> +	.max_register = 511,
> +	.cache_type = REGCACHE_FLAT,
> +	.writeable_reg = caller_writeable_reg,
> +	.readable_reg = caller_readable_reg,
> +	.volatile_reg = caller_volatile_reg,
> +	.reg_defaults = caller_regmap_default,
> +	.num_reg_defaults = ARRAY_SIZE(caller_regmap_default),
> +	/* Methods implementing ptotocol to access PCI-LPC bridge. */
typo: "protocol"
> +	.reg_read = fpga_reg_read,
> +	.reg_write = fpga_reg_write,
> +  };
> +
> +  regmap = devm_regmap_init(&dev, NULL, &caller_regmap_ctx,
> +			    fpga_regmap_config);
> +
> +  Remap FPGA base address.
> +
> +  caller_regmap_ctx.base = devm_ioremap(&fpga_pci_dev->dev,
> +					pci_resource_start(pci_dev, 0),
> +					pci_resource_len(pci_dev, 0));
> +
> +  For each entry in 'regmap_mux_data' array.
> +
> +  mux_regmap_data[i].handle = caller_handle;
> +  mux_regmap_data[i].regmap = regmap;
> +  mux_regmap_data[i].completion_notify = caller_complition_notify;
> +
> +  pdev[i] =
> +  platform_device_register_resndata(dev, "i2c-mux-regmap", i, NULL, 0,
> +				    &regmap_mux_data[i],
> +				    sizeof(regmap_mux_data[i]));
> +
> +  In the above examples two instances of "i2c-mux-regmap" will be created.
> +  For each the array of the created adapter will be passed to
> +  caller_complition_notify(), if this callback was provided.
> +
> +SYSFS example
> +=============
> +  In 'sysfs' the channels will be exposed through path:
> +  /sys/devices/platform/<caller-driver>/<i2c-parent-driver.parent-bus>
> +  Following the above example it will contain:
> +  i2c-mux-regmap.0/channel-1
> +  ...
> +  i2c-mux-regmap.0/channel-8
> +  i2c-mux-regmap.1/channel-1
> +  ...
> +  i2c-mux-regmap.1/channel-8
> +
> +  However, MUX number of each 'i2c-mux-regmap' instance is limited by
> +  the size of selector register.
> +  Thus, if its size is 1 byte - up to 255 MUX channels can be created,
> +  for 2 bytes respectively up to 65535.
> +
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index ea838dbae32e..a509b75bd545 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -99,6 +99,18 @@ config I2C_MUX_REG
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-mux-reg.
>   
> +config I2C_MUX_REGMAP
> +	tristate "Register map based I2C multiplexer"
> +	depends on REGMAP
> +	help
> +	  If you say yes to this option, support will be included for a
> +	  register map based I2C multiplexer. This driver provides access to
> +	  I2C busses connected through a MUX, which is controlled
> +	  by a single register through the regmap.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-mux-regmap.
> +
>   config I2C_DEMUX_PINCTRL
>   	tristate "pinctrl-based I2C demultiplexer"
>   	depends on PINCTRL && OF
> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
> index 6d9d865e8518..092dca428a75 100644
> --- a/drivers/i2c/muxes/Makefile
> +++ b/drivers/i2c/muxes/Makefile
> @@ -14,5 +14,6 @@ obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
>   obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
>   obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
>   obj-$(CONFIG_I2C_MUX_REG)	+= i2c-mux-reg.o
> +obj-$(CONFIG_I2C_MUX_REGMAP)	+= i2c-mux-regmap.o
>   
>   ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
> diff --git a/drivers/i2c/muxes/i2c-mux-regmap.c b/drivers/i2c/muxes/i2c-mux-regmap.c
> new file mode 100644
> index 000000000000..0414b0ce9096
> --- /dev/null
> +++ b/drivers/i2c/muxes/i2c-mux-regmap.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> +/*
> + * Regmap i2c mux driver
> + *
> + * Copyright (C) 2023 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-mux.h>
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/i2c-mux-regmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +/* i2c_mux_regmap - mux control structure:
> + * @last_val - last selected register value or -1 if mux deselected;
> + * @parent - parent I2C adapter;
> + * @pdata: platform data;
> + */
> +struct i2c_mux_regmap {
> +	int last_val;
> +	struct i2c_adapter *parent;
> +	struct i2c_mux_regmap_platform_data pdata;
> +};
> +
> +static int i2c_mux_regmap_select_chan(struct i2c_mux_core *muxc, u32 chan)
> +{
> +	struct i2c_mux_regmap *mux = i2c_mux_priv(muxc);
> +	int err = 0;
> +
> +	/* Only select the channel if its different from the last channel */
Typo: "it's"
> +	if (mux->last_val != chan) {
> +		err = regmap_write(mux->pdata.regmap, mux->pdata.sel_reg_addr, chan);

nitpick but the last 2 args of regmap_write should be of type 'unsigned int'

Maybe use this type for both `chan` and `sel_reg_addr` ?

> +		mux->last_val = err < 0 ? -1 : chan;
> +	}
> +
> +	return err;
> +}
> +
> +static int i2c_mux_regmap_deselect(struct i2c_mux_core *muxc, u32 chan)
> +{
> +	struct i2c_mux_regmap *mux = i2c_mux_priv(muxc);
> +
> +	/* Deselect active channel */
> +	mux->last_val = -1;
> +
> +	return regmap_write(mux->pdata.regmap, mux->pdata.sel_reg_addr, 0);
> +}
> +
> +/* Probe/reomove functions */
Typo "remove"
> +static int i2c_mux_regmap_probe(struct platform_device *pdev)
> +{
> +	struct i2c_mux_regmap_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +	struct i2c_mux_regmap *mux;
> +	struct i2c_mux_core *muxc;
> +	int num, err;
> +
> +	if (!pdata)
> +		return -EINVAL;
> +
> +	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	memcpy(&mux->pdata, pdata, sizeof(*pdata));
> +	mux->parent = i2c_get_adapter(mux->pdata.parent);
> +	if (!mux->parent)
> +		return -EPROBE_DEFER;
> +
> +	muxc = i2c_mux_alloc(mux->parent, &pdev->dev, pdata->num_adaps, sizeof(*mux), 0,
> +			     i2c_mux_regmap_select_chan, i2c_mux_regmap_deselect);
> +	if (!muxc) {
> +		err = -ENOMEM;
> +		goto err_i2c_mux_alloc;
> +	}
> +
> +	platform_set_drvdata(pdev, muxc);
> +	muxc->priv = mux;
> +	mux->last_val = -1; /* force the first selection */
> +
> +	/* Create an adapter for each channel. */
> +	for (num = 0; num < pdata->num_adaps; num++) {
> +		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
> +		if (err)
> +			goto err_i2c_mux_add_adapter;
> +	}
> +
> +	/* Notify caller when all channels' adapters are created. */
> +	if (pdata->completion_notify)
> +		pdata->completion_notify(pdata->handle, muxc->parent, muxc->adapter);
> +
> +	return 0;
> +
> +err_i2c_mux_add_adapter:
> +	i2c_mux_del_adapters(muxc);
> +err_i2c_mux_alloc:
> +	i2c_put_adapter(mux->parent);
> +	return err;
> +}
> +
> +static void i2c_mux_regmap_remove(struct platform_device *pdev)
> +{
> +	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
> +	struct i2c_mux_regmap *mux = muxc->priv;
> +
> +	i2c_mux_del_adapters(muxc);
> +	i2c_put_adapter(mux->parent);
> +}
> +
> +static struct platform_driver i2c_mux_regmap_driver = {
> +	.driver = {
> +		.name = "i2c-mux-regmap",
> +	},
> +	.probe = i2c_mux_regmap_probe,
> +	.remove_new = i2c_mux_regmap_remove,
> +};
> +
> +module_platform_driver(i2c_mux_regmap_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak (vadimp@nvidia.com)");
> +MODULE_DESCRIPTION("Regmap I2C multiplexer driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:i2c-mux-regmap");
> diff --git a/include/linux/platform_data/i2c-mux-regmap.h b/include/linux/platform_data/i2c-mux-regmap.h
> new file mode 100644
> index 000000000000..a06614e5edd2
> --- /dev/null
> +++ b/include/linux/platform_data/i2c-mux-regmap.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0 */
> +/*
> + * Regmap i2c mux driver
> + *
> + * Copyright (C) 2023 Nvidia Technologies Ltd.
> + */
> +
> +#ifndef __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H
> +#define __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H
> +
> +/**
> + * struct i2c_mux_regmap_platform_data - Platform-dependent data for i2c-mux-regmap
> + * @regmap: register map of parent device;
> + * @parent: Parent I2C bus adapter number
> + * @chan_ids - channels array
> + * @num_adaps - number of adapters
> + * @sel_reg_addr - mux select register offset in CPLD space
> + * @reg_size: register size in bytes
> + * @handle: handle to be passed by callback
> + * @completion_notify: callback to notify when all the adapters are created
> + */
> +struct i2c_mux_regmap_platform_data {
> +	void *regmap;
> +	int parent;
> +	const unsigned int *chan_ids;
> +	int num_adaps;
Why not using unsigned int for `num_adaps` as well?
> +	int sel_reg_addr;
> +	u8 reg_size;
> +	void *handle;
> +	int (*completion_notify)(void *handle, struct i2c_adapter *parent,
> +				 struct i2c_adapter *adapters[]);
> +};
> +
> +#endif	/* __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H */

Regards,

-- 

Yann





