Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB4550AEB8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Apr 2022 06:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236246AbiDVEL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Apr 2022 00:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443780AbiDVEL0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Apr 2022 00:11:26 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2109.outbound.protection.outlook.com [40.107.93.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B83F4E3B1;
        Thu, 21 Apr 2022 21:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtnCn+Pgt92Wipq5dL42wd8oFKUocG7LvWbS72TYSnzMHTdbpQ45K3OWuIRU0gzuJXHOcrcaMvQkurwrQF3PwDYa249ShwukpcXXGn2bguP8x9dD4oMeP2R4AHz+qn4quEV8zm7cxLilHm30bJsqQCJG0OTTffpX2pQoJkMOZWrMaJA1UCfM2Z18fImrQXg/uzdTMdSFz/tF+XTRCFPWSIx/XWCyq7BoRyjak/v2fZhjMk17/LzXNHoBvJSbxTerNuA+wX/t/X7bAnwCL8LajXU3TV2+OHTbrdBp2twSw5dFi/BEaVLej87VctfhW4e8rki9tPPcGGadGNrMau/OwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTQBVvoe0mn1EwNw+y7mggRy4gT1KhPzcKcBXMZVKYE=;
 b=jNFFn3/EYIm2w13nBGUxXlzekiCK9HOFPT6r5No59YaH0scsT47BDBrpFiR7NDB01Zhgp/OySLX68FhPWuCm9Xc4CeKHUAcbtARmKCIkZaPwxtbgcWRoPvcJUNftpazVnPr6JcOzyVtr4XPQ9OR+2J0hV9cA/RIUH2BYW+srtJMjdHkXcvlM3sDPUPUcN6n1hmf2XfJn/dshRa9SM82YZEQGY54Bnyyte/u7f9I/wLF+PU+kh0vmHeyxcu/Xt+u0xhUP27caQIJ5Y7EvpDPVFa0UIMqtS7EAU1ju3NIi00cdNlZE1Edfn8QaVlPBXL2ndZWETHuda1jD3UrLVSWfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTQBVvoe0mn1EwNw+y7mggRy4gT1KhPzcKcBXMZVKYE=;
 b=ulUgkbq4kl9LMRRwGa5U5nxFgpPoHoNdOzHeFF+Zmdjo8MOTSgUIjZfuSM9CHzPJNUgzwv17UBaMz8xXt1EUv/S5aREft2L8LfB1RjwviBXJ0jK58yMC6scMjXzA2UcD5hg1daRB80w7vFOdzXHf3DpHxx+up2EIHq9jpGu1YiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3587.prod.exchangelabs.com (2603:10b6:207:38::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Fri, 22 Apr 2022 04:08:30 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 04:08:30 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Date:   Fri, 22 Apr 2022 11:08:01 +0700
Message-Id: <20220422040803.2524940-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422040803.2524940-1-quan@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47610ab4-4dcb-4d6e-cffe-08da2415c24a
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3587:EE_
X-Microsoft-Antispam-PRVS: <BL0PR0102MB35876F7539DBEF71899C95CDF2F79@BL0PR0102MB3587.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oqe2OjO+QR+UrtfDlfN5INm6q+Jd+HddaGl+UkLCRaOBcIjlRMDKRPnnRyv4pdzUjXWYBShvnD/xCXj7n7l9OnG+NHC0GtxUs6jCzbLoFvt7hhNNlrk7juoF980D7CZUylFqeJcMLMlxMkjqs+bl/qVAeFmPZsgXHeb6tjHBdL1urq9MNAdLjHzwytxtCzl5kxB4KUP1Co7z23AlwLzkiAwAEWCgDsQRpgeQ9vn5Yb09RCSwWmfEKzS2kG6GL8Qv1zyvziO/B9B2vb5tlxSL+gIeP8Fi6UCvcql+Abml2ahMWcMEwIG/Vc+kSy6mZSZBXwVnmjFeyYJV7228zikuenK5hR7T8LwSR0RIPt5mVbKwadqFqPmFwZTZGjzCEG/rs2DHEEpTCX6d5Ja5Cfg5RSJiuwxqzkK0Fl0wsu7O7hviNNyluMK1MYIF6DF20Hth7bHxRYXUOTX5zqz44W0xPv79pC0eb6RDMXv/iJFNPDT4pjfzcUBqTX5bdAIQ4yNF3eCrePmTA0aGWKSB1kD/9KchOnOkh6DJFX71UAlSgkd7KFc4gzFmz5+xfde17c0uMYdCaqHEcyWUoiZGCJUu8z80odKjFPct475L9mnS5oBWoQ3ngIm0isCXhgdXXBtphrbReOLJekKdN3gdyVvXLSoxKkNnAUjvlIYjgvTH2k1UngcVr7y8a0Qco6kEsSf/cJjVp+LKb3qf9FGWyKn2f72dL+VG5E044qVp/JYnHAn5iGYtQT8GuizxMDynlW4B17kWCcn6FcS1/fEFrZUONMFTuAXlyUqt4kcdar+sCrCqthMuDLLMQsGoKYqazBu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(186003)(30864003)(4326008)(921005)(38100700002)(54906003)(66946007)(7416002)(86362001)(110136005)(8676002)(6486002)(38350700002)(8936002)(966005)(83380400001)(52116002)(2906002)(66476007)(66556008)(5660300002)(508600001)(1076003)(6512007)(6506007)(2616005)(26005)(6666004)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtrN0lBOXAyQWRWVklsbVZLMnZUWkNEMXpmay95QUI0bWE1bWUyb0RqK2g0?=
 =?utf-8?B?SkIzODdPSlVBSE10UTQ2QlplNVdZZy9sQmhlQ2VGTXJNaFdxY1pia0htdCsx?=
 =?utf-8?B?SHRXWHoyZW5FVmdaeHVWREw1TENScmpBYkRWZHdiV2pqMGMzT3QyTE1oWTJq?=
 =?utf-8?B?NGoyRjZXWXJ2WnJXbW9GV2MrZVB4MmFFUW84ZDF2aFJJbm9GT2JkRFlzU2c4?=
 =?utf-8?B?ZWV2UGRCT3Yvemx3TWN5ci9kZC9xcE1iV1VmcGhZUU16K0xTaER4NUpIbW9F?=
 =?utf-8?B?MFpNMUUvZzR6YlRiQ05yOEs0eEJOa1RHTDVFT1djeFVqUXh2b1p2bEs0NnBw?=
 =?utf-8?B?QloxRk5PdmUyYllJU2c0Q2M5V2hsSzVaakVmNnExZE1MdkZKaVVvbWRoMXZj?=
 =?utf-8?B?WW9hVHpYSFpqaWtrbk8yM2xXaVhnelZ6c3ZTZytuMmkwNnV1SmVnbmlpR2Jh?=
 =?utf-8?B?ekhLT1lmUlhncmZIWllhMXVweFIzODdUR0FWSEFwZmtVU1NrMkJnWUZvTXdM?=
 =?utf-8?B?ZGIwOWdFV0N2clNrQXBiVTBIc2dGRE5CeTQrb2VrRGNCejB5KzkrT3BkM0s2?=
 =?utf-8?B?dVlCUGR6WmhQV3JnUDQ1QlEzT2IzSWNSUFlwRWlaYiszcWJVbWZmbk1OK0Jm?=
 =?utf-8?B?c09XbVBjZ2pVdEF2OUdIdWM3MmlsVmZzOE9iYXVISHhEMDJtSUE2YXFpNGNP?=
 =?utf-8?B?RTBJWGltUFZLQ3dxQXJGWjRpbG4xSEFmWis0aHA0TnNEQWxDZWpzVnVkdCto?=
 =?utf-8?B?b1A4cWJTREdLUHpRcGY2bW8xcUpWSUgvQmxZQTZDWE9OVkhzVEJDZG5HbmUv?=
 =?utf-8?B?cEthdE5Nakh2RzROR2U2R1MwMktUOVdTVjNFblp1emcrV0JCSVNRTlVLUnBC?=
 =?utf-8?B?OTdUcEYvK05LVnRGd2gyRU40SVR2UVJxZjRWbDFoTkZBQldUcjVUV2c0anp3?=
 =?utf-8?B?ZVp6d1RCdzhmY3JyM2UxcjdGY3ZpMkZRN3ZSK0Rta0YvTEhzVi9UR2dkdmFN?=
 =?utf-8?B?dTVUbDR1azd1Rk5qL2VybzQ1Sk9vNExWZWU3ZjVYSnFkWDZNR0doMm80M2FB?=
 =?utf-8?B?Skl3ZVRabFB4V2V4Y0RQQjQwajFUSW1XcHpuNWFHN2w5SUhzYlRPZUxqZlBt?=
 =?utf-8?B?WEI4R1EwRUMzSHZFWC9xUzhrRm0yNlpDVlpZbENwYXphbDg0bHg4MjQ4Nm5Z?=
 =?utf-8?B?b2huZDI2dkpGZUdCWnlrSDdnSDFlbzNMWjdhNmJ3dlpiTEdld1BzUTllVzd3?=
 =?utf-8?B?ODQ2YVd6SzJIaS80clMzL3ZjVEgrMUlFbXZtYVJ5amk5aGVseXg1MUZCVDRR?=
 =?utf-8?B?RlpYT3NRUHVZdmcyZGJNYTRKemsyLzNTZEp5dzk3TWFaOURVNXdZVWpCRnpq?=
 =?utf-8?B?ZTNvVkhrQkljZWprdVFxUTZpclZ2ZVRhVEZaMGpDQThYN043S2JpdVNoSGto?=
 =?utf-8?B?Z2xnRmovQitOVUtwZFR2VGdqR0d6cDBJeGRwbnU0ZERoOXZJSGw5R1JpRWt4?=
 =?utf-8?B?V0w3TWJPdnlXaEdQODBIclBEQnA5RVNDUDlGZWdFSXJ6Z2FtdkdZcGVlclJq?=
 =?utf-8?B?UmQvaXUrL2hKbUV3UEY2YUdMRktsMU5NVFJ4RXYrTzhFWHhheGpwUG9zbzZ6?=
 =?utf-8?B?YXdVbTEzNlp4QVVDM2N3aVJPdVQyZnNuK2lieVBYNVJxb1NLblBxQkdaL2Vv?=
 =?utf-8?B?MkJCNDFZUmZJZ3l0TzZuZGNwRi9STHNUZUs1bm1vNVpVUTQ0LzFaWWJYTmxS?=
 =?utf-8?B?eHAzb2wrR3R0SkNtS25BcjBBN1E3NUNwL2VtWDltOXRkeHhhT0szRUhLL3Yw?=
 =?utf-8?B?T1BWYmsvRlhtMU9wdWdHVTBQUTk3VHFtOXFLUEZpRW9wcFNQa3Z2dTczQ0pW?=
 =?utf-8?B?Ri9MNFlZS2xxWkFXTEtXeThwL3FVclZaZ3c0azNNVFlZTy92TWtsaHFqZ0xk?=
 =?utf-8?B?ck1JeTRVempxb2dJcGtUN2p4aldSN2RJVFA2bU1CcEdjeXJDSFRkZ3Bjdm42?=
 =?utf-8?B?elZpWjVmSVN1YXZia3FiaEVHUCt5Uk8zSjBZbkFPY2hxemZBSCs5NDA1K2ps?=
 =?utf-8?B?S1hPaXhNbzR5aERsNVZhQisrN0lzY2lKc3NLVnlYWTJZNTROVzc3Y2kwbjNs?=
 =?utf-8?B?Z2tyTFFqYUZlSzZGczZSNVY1ME9ORVdhSEE5Z1BYdUhpeEwrTjdvU1JnWVVU?=
 =?utf-8?B?L3JMY29ERW1pNStjcDBNNzNPNjhPK2tReEgyZWtEVWpyWlFjcTRQSHV2WXZE?=
 =?utf-8?B?N240cStrZ3J1OXlSZ01GZ0Qyd21mTU1BWXFsZmxaRkw4WTNkSTNkMmgwOE1D?=
 =?utf-8?B?ZUEvVW5YQUh1VHhQcGxkSVo3ckhDbjN3MFVtcEpramNKUk1seGkzM3d0cklw?=
 =?utf-8?Q?roHKvRz4F7t0t45x5tSiWIMlhO2tWIdpWc3rM?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47610ab4-4dcb-4d6e-cffe-08da2415c24a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 04:08:30.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6l76KiiQDpPoGAEONKs+afOohC2+o4qNMKizbV245Ngb3mR3WAjTQAp2UHWavAUV99LdRDvRh2spsvYijCa+Gc+9PWqFLTRwg/Zg2HojDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3587
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

Thanks Dan for the copy_from_user() fix in the link below.

Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan@os.amperecomputing.com/
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v7:
  + Remove unneccessary del_timer() in response_timeout()        [Corey]
  + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
  + Add MODULE_DEVICE_TABLE(of, ssif_bmc_match), fix blank line    [Jae]
  + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
  + Solve possible issue if both response timer and ssif_bmc_write()
  occurred at the same time                                      [Corey]
  + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
  + Refactor and introduce ssif_part_buffer struct to replace the
  response_buf to manage each send/receive part of ssif           [Quan]
  + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
  + Support abort feature to skip the current bad request/response and
  wait until next new request                                    [Corey]
  + Refactor the PEC calculation to avoid the re-calculate the PEC on
  each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
  + Fix the use of error-proned idx                              [Corey]
  + Defer the test for valid SMBus command until the read/write part
  is determined                                                   [Quan]
  + Change/split unsupported_smbus_cmd() to
  supported_[write|read]_cmd()                                   [Corey]
  + Abort the request if somehow its size exceeded 255 bytes      [Quan]

v6:
  + Drop the use of slave_enable()                             [Wolfram]
  + Make i2c-aspeed to issue RxCmdLast command on all
  I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
  + Make i2c slave to return -EBUSY when it's busy                [Quan]
  + Drop the aborting feature as return Completion Code 0xFF may stop
  host to retry and make ipmi_ssif.so fails to load               [Quan]
  + Add timer to recover slave from busy state when no response   [Quan]
  + Clean request/response buffer appropriately                   [Quan]
  + Add some minor change on error and warning messages           [Quan]

v5:
  + None

v4:
  + Send response with Completion code 0xFF when aborting         [Quan]
  + Added bounding check on SMBus writes and the whole request     [Dan]
  + Moved buffer to end of struct ssif_bmc_ctx to avoid context
    corruption if somehow buffer is written past the end           [Dan]
  + Return -EINVAL if userspace buffer too small, dont
    silence truncate                                       [Corey, Joel]
  + Not necessary to check NONBLOCK in lock                      [Corey]
  + Enforce one user at a time                                    [Joel]
  + Reject write with invalid response length from userspace     [Corey]
  + Add state machines for better ssif bmc state handling         [Quan]
  + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
    SSIF BMC driver                                               [Quan]
  + Change compatible string "aspeed,ast2500-ssif-bmc" to
    "ampere,ssif-bmc"                                             [Quan]
  + Abort current request with invalid SMBus write or
    invalid command                                               [Quan]
  + Abort all request if there is pending response                [Quan]
  + Changed validate_pec() to validate_request()                  [Quan]
  + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
  + Print internal state string for ease investigating issue      [Quan]
  + Move to READY state on SLAVE_STOP event                       [Quan]
  + Change initilize_transfer() to process_smbus_cmd()            [Quan]
  + Introduce functions for each slave event                      [Quan]

v3:
  + Removed redundant license info                                [Joel]
  + Switched to use traditional if-else                           [Joel]
  + Removed unused ssif_bmc_ioctl()                               [Joel]
  + Made handle_request()/complete_response() to return void      [Joel]
  + Refactored send_ssif_bmc_response() and
  receive_ssif_bmc_request()                                     [Corey]
  + Removed mutex                                                [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
  + Removed the unnecessary memset                               [Corey]
  + Switch to use dev_err()                                      [Corey]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

 drivers/char/ipmi/Kconfig    |  11 +
 drivers/char/ipmi/Makefile   |   1 +
 drivers/char/ipmi/ssif_bmc.c | 780 +++++++++++++++++++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h | 107 +++++
 4 files changed, 899 insertions(+)
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index b061e6b513ed..18a89093d64e 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
 	  found on Aspeed SOCs (AST2400 and AST2500). The driver
 	  implements the BMC side of the BT interface.
 
+config SSIF_IPMI_BMC
+	tristate "SSIF IPMI BMC driver"
+	select I2C
+	select I2C_SLAVE
+	help
+	  This enables the IPMI SMBus system interface (SSIF) at the
+	  management (BMC) side.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF).
+
 config IPMB_DEVICE_INTERFACE
 	tristate 'IPMB Interface handler'
 	depends on I2C
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 7ce790efad92..cb6138b8ded9 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
+obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
new file mode 100644
index 000000000000..4cff5e1a075e
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -0,0 +1,780 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+
+#include "ssif_bmc.h"
+
+static const char *state_to_string(enum ssif_state state)
+{
+	switch (state) {
+	case SSIF_READY:
+		return "SSIF_READY";
+	case SSIF_START:
+		return "SSIF_START";
+	case SSIF_SMBUS_CMD:
+		return "SSIF_SMBUS_CMD";
+	case SSIF_REQ_RECVING:
+		return "SSIF_REQ_RECVING";
+	case SSIF_RES_SENDING:
+		return "SSIF_RES_SENDING";
+	case SSIF_ABORTING:
+		return "SSIF_ABORTING";
+	default:
+		return "SSIF_STATE_UNKNOWN";
+	}
+}
+
+/* Handle SSIF message that will be sent to user */
+static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	while (!ssif_bmc->request_available) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       ssif_bmc->request_available);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	if (count < min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg))) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		ret = -EINVAL;
+	} else {
+		count = min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg));
+		memcpy(&msg, &ssif_bmc->request, count);
+		ssif_bmc->request_available = false;
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+		ret = copy_to_user(buf, &msg, count);
+	}
+
+	return (ret < 0) ? ret : count;
+}
+
+/* Handle SSIF message that is written by user */
+static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
+			      loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	if (count > sizeof(struct ssif_msg))
+		return -EINVAL;
+
+	if (copy_from_user(&msg, buf, count))
+		return -EFAULT;
+
+	if (!msg.len || count < msg.len + 1)
+		return -EINVAL;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	while (ssif_bmc->response_in_progress) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       !ssif_bmc->response_in_progress);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	/*
+	 * The write must complete before the response timeout fired, otherwise
+	 * the response is aborted and wait for next request
+	 * Return -EINVAL if the response is aborted
+	 */
+	ret = (ssif_bmc->response_timer_inited) ? 0 : -EINVAL;
+	if (ret)
+		goto exit;
+
+	del_timer(&ssif_bmc->response_timer);
+	ssif_bmc->response_timer_inited = false;
+
+	memcpy(&ssif_bmc->response, &msg, count);
+	ssif_bmc->is_singlepart_read = (msg.len <= MAX_PAYLOAD_PER_TRANSACTION);
+
+	ssif_bmc->response_in_progress = true;
+
+	/* ssif_bmc not busy */
+	ssif_bmc->busy = false;
+
+	/* Clean old request buffer */
+	memset(&ssif_bmc->request, 0, sizeof(struct ssif_msg));
+exit:
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return (ret < 0) ? ret : count;
+}
+
+static int ssif_bmc_open(struct inode *inode, struct file *file)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	int ret = 0;
+
+	spin_lock_irq(&ssif_bmc->lock);
+	if (!ssif_bmc->running)
+		ssif_bmc->running = 1;
+	else
+		ret = -EBUSY;
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return ret;
+}
+
+static __poll_t ssif_bmc_poll(struct file *file, poll_table *wait)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	__poll_t mask = 0;
+
+	poll_wait(file, &ssif_bmc->wait_queue, wait);
+
+	spin_lock_irq(&ssif_bmc->lock);
+	/* The request is available, userspace application can get the request */
+	if (ssif_bmc->request_available)
+		mask |= POLLIN;
+
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return mask;
+}
+
+static int ssif_bmc_release(struct inode *inode, struct file *file)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+
+	spin_lock_irq(&ssif_bmc->lock);
+	ssif_bmc->running = 0;
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return 0;
+}
+
+/*
+ * System calls to device interface for user apps
+ */
+static const struct file_operations ssif_bmc_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ssif_bmc_open,
+	.read		= ssif_bmc_read,
+	.write		= ssif_bmc_write,
+	.release	= ssif_bmc_release,
+	.poll		= ssif_bmc_poll,
+};
+
+/* Called with ssif_bmc->lock held. */
+static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
+{
+	/* Invalidate response in buffer to denote it having been sent. */
+	ssif_bmc->response.len = 0;
+	ssif_bmc->response_in_progress = false;
+	ssif_bmc->nbytes_processed = 0;
+	ssif_bmc->remain_len = 0;
+	ssif_bmc->busy = false;
+	memset(&ssif_bmc->part_buf, 0, sizeof(struct ssif_part_buffer));
+	wake_up_all(&ssif_bmc->wait_queue);
+}
+
+static void response_timeout(struct timer_list *t)
+{
+	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+
+	/* Do nothing if the response is in progress */
+	if (!ssif_bmc->response_in_progress) {
+		/* Recover ssif_bmc from busy */
+		ssif_bmc->busy = false;
+		ssif_bmc->response_timer_inited = false;
+		/* Set aborting flag */
+		ssif_bmc->aborting = true;
+	}
+
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+}
+
+/* Called with ssif_bmc->lock held. */
+static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
+{
+	/* set ssif_bmc to busy waiting for response */
+	ssif_bmc->busy = true;
+	/* Request message is available to process */
+	ssif_bmc->request_available = true;
+	/* Clean old response buffer */
+	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
+	/* This is the new READ request.*/
+	wake_up_all(&ssif_bmc->wait_queue);
+
+	/* Armed timer to recover slave from busy state in case of no response */
+	if (!ssif_bmc->response_timer_inited) {
+		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
+		ssif_bmc->response_timer_inited = true;
+	}
+	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
+}
+
+static void calculate_response_part_pec(struct ssif_part_buffer *part)
+{
+	u8 addr = part->address;
+
+	/* PEC - Start Read Address */
+	part->pec = i2c_smbus_pec(0, &addr, 1);
+	/* PEC - SSIF Command */
+	part->pec = i2c_smbus_pec(part->pec, &part->smbus_cmd, 1);
+	/* PEC - Restart Write Address */
+	addr = addr | 0x01;
+	part->pec = i2c_smbus_pec(part->pec, &addr, 1);
+	part->pec = i2c_smbus_pec(part->pec, &part->length, 1);
+	if (part->length)
+		part->pec = i2c_smbus_pec(part->pec, part->payload, part->length);
+}
+
+static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
+{
+	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
+
+	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
+	part->length = ssif_bmc->response.len;
+
+	/* Clear the rest to 0 */
+	memset(part->payload + part->length, 0, MAX_PAYLOAD_PER_TRANSACTION - part->length);
+	memcpy(&part->payload[0], &ssif_bmc->response.payload[0], part->length);
+}
+
+static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
+{
+	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
+	u8 part_len = 0;
+
+	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
+	switch (part->smbus_cmd) {
+	case SSIF_IPMI_MULTIPART_READ_START:
+		/*
+		 * Read Start length is 32 bytes.
+		 * Read Start transfer first 30 bytes of IPMI response
+		 * and 2 special code 0x00, 0x01.
+		 */
+		ssif_bmc->nbytes_processed = 0;
+		ssif_bmc->block_num = 0;
+		part->length = MAX_PAYLOAD_PER_TRANSACTION;
+		part_len = MAX_IPMI_DATA_PER_START_TRANSACTION;
+		ssif_bmc->remain_len = ssif_bmc->response.len - part_len;
+
+		part->payload[0] = 0x00; /* Start Flag */
+		part->payload[1] = 0x01; /* Start Flag */
+
+		memcpy(&part->payload[2], &ssif_bmc->response.payload[0], part_len);
+		break;
+
+	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
+		/*
+		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
+		 * IPMI data plus block number byte.
+		 */
+		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
+			/*
+			 * This is READ End message
+			 *  Return length is the remaining response data length
+			 *  plus block number
+			 *  Block number 0xFF is to indicate this is last message
+			 *
+			 */
+			/* Clean the buffer */
+			memset(&part->payload[0], 0, MAX_PAYLOAD_PER_TRANSACTION);
+			part->length = ssif_bmc->remain_len + 1;
+			part_len = ssif_bmc->remain_len;
+			ssif_bmc->block_num = 0xFF;
+			part->payload[0] = ssif_bmc->block_num;
+		} else {
+			/*
+			 * This is READ Middle message
+			 *  Response length is the maximum SMBUS transfer length
+			 *  Block number byte is incremented
+			 * Return length is maximum SMBUS transfer length
+			 */
+			part->length = MAX_PAYLOAD_PER_TRANSACTION;
+			part_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
+			part->payload[0] = ssif_bmc->block_num;
+			ssif_bmc->block_num++;
+		}
+
+		ssif_bmc->remain_len -= part_len;
+		memcpy(&part->payload[1], ssif_bmc->response.payload + ssif_bmc->nbytes_processed,
+		       part_len);
+		break;
+
+	default:
+		/* Do not expect to go to this case */
+		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
+			__func__, part->smbus_cmd);
+		break;
+	}
+
+	ssif_bmc->nbytes_processed += part_len;
+}
+
+static bool supported_read_cmd(u8 cmd)
+{
+	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
+	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
+	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
+		return true;
+
+	return false;
+}
+
+static bool supported_write_cmd(u8 cmd)
+{
+	if (cmd == SSIF_IPMI_SINGLEPART_WRITE ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_END)
+		return true;
+
+	return false;
+}
+
+/* Process the IPMI response that will be read by master */
+static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
+
+	/* msg_idx start from 0 */
+	if (part->index < part->length)
+		*val = part->payload[part->index];
+	else if (part->index == part->length && ssif_bmc->pec_support)
+		*val = part->pec;
+	else
+		*val = 0;
+
+	part->index++;
+}
+
+static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	/* msg_idx should not be 0 when reach here */
+	if (!ssif_bmc->msg_idx || ssif_bmc->msg_idx > MAX_TRANSACTION)
+		return;
+
+	if (ssif_bmc->msg_idx == 1) {
+		ssif_bmc->part_buf.length = *val;
+		ssif_bmc->part_buf.index = 0;
+	} else {
+		ssif_bmc->part_buf.payload[ssif_bmc->part_buf.index++] = *val;
+	}
+
+	ssif_bmc->msg_idx++;
+}
+
+static bool validate_request_part(struct ssif_bmc_ctx *ssif_bmc)
+{
+	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
+	bool ret = true;
+	u8 cpec;
+	u8 addr;
+
+	if (part->index == part->length) {
+		/* PEC is not included */
+		ssif_bmc->pec_support = false;
+		ret = true;
+		goto exit;
+	}
+
+	if (part->index != part->length + 1) {
+		ret = false;
+		goto exit;
+	}
+
+	/* PEC is included */
+	ssif_bmc->pec_support = true;
+	part->pec = part->payload[part->length];
+	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+	cpec = i2c_smbus_pec(0, &addr, 1);
+	cpec = i2c_smbus_pec(cpec, &part->smbus_cmd, 1);
+	cpec = i2c_smbus_pec(cpec, &part->length, 1);
+	/*
+	 * As SMBus specification does not allow the length
+	 * (byte count) in the Write-Block protocol to be zero.
+	 * Therefore, it is illegal to have the last Middle
+	 * transaction in the sequence carry 32-byte and have
+	 * a length of ‘0’ in the End transaction.
+	 * But some users may try to use this way and we should
+	 * prevent ssif_bmc driver broken in this case.
+	 */
+	if (part->length)
+		cpec = i2c_smbus_pec(cpec, part->payload, part->length);
+
+	if (cpec != part->pec)
+		ret = false;
+
+exit:
+	return ret;
+}
+
+static void process_request_part(struct ssif_bmc_ctx *ssif_bmc)
+{
+	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
+
+	switch (part->smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		/* save the whole part to request*/
+		ssif_bmc->request.len = part->length;
+		memcpy(ssif_bmc->request.payload, part->payload, part->length);
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+			ssif_bmc->request.len = 0;
+
+		fallthrough;
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		/* Do the bound check here, not allow the request len exceed 254 bytes */
+		if (ssif_bmc->request.len <= MSG_PAYLOAD_LEN_MAX - part->length) {
+			memcpy(ssif_bmc->request.payload + ssif_bmc->request.len,
+			       part->payload, part->length);
+			ssif_bmc->request.len += part->length;
+		} else {
+			dev_warn(&ssif_bmc->client->dev,
+				 "Warn: Request exceeded 254 bytes, aborting");
+			/* Request too long, aborting */
+			ssif_bmc->aborting =  true;
+		}
+		break;
+	default:
+		/* Do not expect to go to this case */
+		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
+			__func__, part->smbus_cmd);
+		break;
+	}
+}
+
+static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	/* SMBUS command can vary (single or multi-part) */
+	ssif_bmc->part_buf.smbus_cmd = *val;
+	ssif_bmc->msg_idx = 1;
+
+	if (*val == SSIF_IPMI_SINGLEPART_WRITE || *val == SSIF_IPMI_MULTIPART_WRITE_START) {
+		/*
+		 * The response maybe not come in-time, causing host SSIF driver
+		 * to timeout and resend a new request. In such case check for
+		 * pending response and clear it
+		 */
+		if (ssif_bmc->response_in_progress)
+			complete_response(ssif_bmc);
+
+		/* This is new request, flip aborting flag if set */
+		if (ssif_bmc->aborting)
+			ssif_bmc->aborting = false;
+	}
+}
+
+static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_REQ_RECVING ||
+	    ssif_bmc->state == SSIF_RES_SENDING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_ABORTING;
+		*val = 0;
+		return;
+
+	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
+		if (!supported_read_cmd(ssif_bmc->part_buf.smbus_cmd)) {
+			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus read command=0x%x",
+				 ssif_bmc->part_buf.smbus_cmd);
+			ssif_bmc->aborting = true;
+		}
+
+		if (ssif_bmc->aborting)
+			ssif_bmc->state = SSIF_ABORTING;
+		else
+			ssif_bmc->state = SSIF_RES_SENDING;
+	}
+
+	ssif_bmc->msg_idx = 0;
+
+	/* Send 0 if there is nothing to send */
+	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
+		*val = 0;
+		return;
+	}
+
+	if (ssif_bmc->is_singlepart_read)
+		set_singlepart_response_buffer(ssif_bmc);
+	else
+		set_multipart_response_buffer(ssif_bmc);
+
+	calculate_response_part_pec(&ssif_bmc->part_buf);
+	ssif_bmc->part_buf.index = 0;
+	*val = ssif_bmc->part_buf.length;
+}
+
+static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_REQ_RECVING ||
+	    ssif_bmc->state == SSIF_SMBUS_CMD) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_ABORTING;
+		*val = 0;
+		return;
+	}
+
+	/* Send 0 if there is nothing to send */
+	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
+		*val = 0;
+		return;
+	}
+
+	handle_read_processed(ssif_bmc, val);
+}
+
+static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
+		ssif_bmc->state = SSIF_START;
+
+	} else if (ssif_bmc->state == SSIF_START ||
+		   ssif_bmc->state == SSIF_REQ_RECVING ||
+		   ssif_bmc->state == SSIF_RES_SENDING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_ABORTING;
+		return;
+	}
+
+	ssif_bmc->msg_idx = 0;
+	ssif_bmc->part_buf.address = *val;
+}
+
+static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_RES_SENDING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_ABORTING;
+
+	} else if (ssif_bmc->state == SSIF_START) {
+		ssif_bmc->state = SSIF_SMBUS_CMD;
+
+	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
+		if (!supported_write_cmd(ssif_bmc->part_buf.smbus_cmd)) {
+			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus write command=0x%x",
+				 ssif_bmc->part_buf.smbus_cmd);
+			ssif_bmc->aborting = true;
+		}
+
+		if (ssif_bmc->aborting)
+			ssif_bmc->state = SSIF_ABORTING;
+		else
+			ssif_bmc->state = SSIF_REQ_RECVING;
+	}
+
+	/* This is response sending state */
+	if (ssif_bmc->state == SSIF_REQ_RECVING)
+		handle_write_received(ssif_bmc, val);
+	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
+		process_smbus_cmd(ssif_bmc, val);
+}
+
+static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_SMBUS_CMD ||
+	    ssif_bmc->state == SSIF_ABORTING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_READY;
+
+	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
+		if (validate_request_part(ssif_bmc)) {
+			process_request_part(ssif_bmc);
+			if (ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
+			    ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
+				handle_request(ssif_bmc);
+			ssif_bmc->state = SSIF_READY;
+		} else {
+			/*
+			 * A BMC that receives an invalid request drop the data for the write
+			 * transaction and any further transactions (read or write) until
+			 * the next valid read or write Start transaction is received
+			 */
+			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
+			ssif_bmc->aborting = true;
+		}
+	} else if (ssif_bmc->state == SSIF_RES_SENDING) {
+		if (ssif_bmc->is_singlepart_read || ssif_bmc->block_num == 0xFF)
+			/* Invalidate response buffer to denote it is sent */
+			complete_response(ssif_bmc);
+		ssif_bmc->state = SSIF_READY;
+	}
+
+	/* Reset message index */
+	ssif_bmc->msg_idx = 0;
+}
+
+/*
+ * Callback function to handle I2C slave events
+ */
+static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
+{
+	unsigned long flags;
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+	int ret = 0;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+
+	switch (event) {
+	case I2C_SLAVE_READ_REQUESTED:
+		on_read_requested_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_REQUESTED:
+		on_write_requested_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_READ_PROCESSED:
+		on_read_processed_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		on_write_received_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_STOP:
+		on_stop_event(ssif_bmc, val);
+		break;
+
+	default:
+		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
+		break;
+	}
+
+	if (!ssif_bmc->aborting && ssif_bmc->busy)
+		ret = -EBUSY;
+
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return ret;
+}
+
+static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+	int ret;
+
+	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
+	if (!ssif_bmc)
+		return -ENOMEM;
+
+	spin_lock_init(&ssif_bmc->lock);
+
+	init_waitqueue_head(&ssif_bmc->wait_queue);
+	ssif_bmc->request_available = false;
+	ssif_bmc->response_in_progress = false;
+	ssif_bmc->busy = false;
+	ssif_bmc->response_timer_inited = false;
+
+	/* Register misc device interface */
+	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
+	ssif_bmc->miscdev.name = DEVICE_NAME;
+	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
+	ssif_bmc->miscdev.parent = &client->dev;
+	ret = misc_register(&ssif_bmc->miscdev);
+	if (ret)
+		goto out;
+
+	ssif_bmc->client = client;
+	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
+
+	/* Register I2C slave */
+	i2c_set_clientdata(client, ssif_bmc);
+	ret = i2c_slave_register(client, ssif_bmc_cb);
+	if (ret) {
+		misc_deregister(&ssif_bmc->miscdev);
+		goto out;
+	}
+
+	return 0;
+out:
+	devm_kfree(&client->dev, ssif_bmc);
+	return ret;
+}
+
+static int ssif_bmc_remove(struct i2c_client *client)
+{
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+	misc_deregister(&ssif_bmc->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id ssif_bmc_match[] = {
+	{ .compatible = "ssif-bmc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ssif_bmc_match);
+
+static const struct i2c_device_id ssif_bmc_id[] = {
+	{ DEVICE_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
+
+static struct i2c_driver ssif_bmc_driver = {
+	.driver         = {
+		.name           = DEVICE_NAME,
+		.of_match_table = ssif_bmc_match,
+	},
+	.probe          = ssif_bmc_probe,
+	.remove         = ssif_bmc_remove,
+	.id_table       = ssif_bmc_id,
+};
+
+module_i2c_driver(ssif_bmc_driver);
+
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
new file mode 100644
index 000000000000..2c3fc2a4698f
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
+ *
+ */
+#ifndef __SSIF_BMC_H__
+#define __SSIF_BMC_H__
+
+#define DEVICE_NAME				"ipmi-ssif-host"
+
+#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
+
+/* A standard SMBus Transaction is limited to 32 data bytes */
+#define MAX_PAYLOAD_PER_TRANSACTION		32
+/* Transaction includes the address, the command, the length and the PEC byte */
+#define MAX_TRANSACTION				(MAX_PAYLOAD_PER_TRANSACTION + 4)
+
+#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
+#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
+
+#define SSIF_IPMI_SINGLEPART_WRITE		0x2
+#define SSIF_IPMI_SINGLEPART_READ		0x3
+#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
+#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
+#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
+#define SSIF_IPMI_MULTIPART_READ_START		0x3
+#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
+
+/* Include netfn and cmd field */
+#define MSG_PAYLOAD_LEN_MAX			254
+/*
+ * IPMI 2.0 Spec, section 12.7 SSIF Timing,
+ * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
+ * Recover ssif_bmc from busy state if it takes up to 500ms
+ */
+#define RESPONSE_TIMEOUT			500 /* ms */
+
+struct ssif_msg {
+	u8 len;
+	u8 payload[MSG_PAYLOAD_LEN_MAX];
+} __packed;
+
+struct ssif_part_buffer {
+	u8 address;
+	u8 smbus_cmd;
+	u8 length;
+	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
+	u8 pec;
+	u8 index;
+} __packed;
+
+/*
+ * SSIF internal states:
+ *   SSIF_READY         0x00 : Ready state
+ *   SSIF_START         0x01 : Start smbus transaction
+ *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
+ *   SSIF_REQ_RECVING   0x03 : Receiving request
+ *   SSIF_RES_SENDING   0x04 : Sending response
+ *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
+ */
+enum ssif_state {
+	SSIF_READY,
+	SSIF_START,
+	SSIF_SMBUS_CMD,
+	SSIF_REQ_RECVING,
+	SSIF_RES_SENDING,
+	SSIF_ABORTING,
+	SSIF_STATE_MAX
+};
+
+struct ssif_bmc_ctx {
+	struct i2c_client	*client;
+	struct miscdevice	miscdev;
+	int			msg_idx;
+	bool			pec_support;
+	/* ssif bmc spinlock */
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	u8			running;
+	enum ssif_state		state;
+	/* Timeout waiting for response */
+	struct timer_list	response_timer;
+	bool                    response_timer_inited;
+	/* Flag to identify a Multi-part Read Transaction */
+	bool			is_singlepart_read;
+	u8			nbytes_processed;
+	u8			remain_len;
+	u8			recv_len;
+	/* Block Number of a Multi-part Read Transaction */
+	u8			block_num;
+	bool			request_available;
+	bool			response_in_progress;
+	bool			busy;
+	bool			aborting;
+	/* Buffer for SSIF Transaction part*/
+	struct ssif_part_buffer	part_buf;
+	struct ssif_msg		response;
+	struct ssif_msg		request;
+};
+
+static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
+{
+	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
+}
+#endif /* __SSIF_BMC_H__ */
-- 
2.35.1

