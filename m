Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580D24C2C3F
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 13:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbiBXM4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 07:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiBXM4T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 07:56:19 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073CE214F87;
        Thu, 24 Feb 2022 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645707347; x=1677243347;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ydZkFukMfFYXEUPagCISDIow0TuUnGvkgIxdumTRpY4=;
  b=CJisAL59j25K36owHNQeFylA3hmaCRYW3499MhtOwezQmKnu9wDIWFse
   zkCDnrmkfyYAUXpp4WC7OmRQmCSV4KGduN9+ePm9jtNs2kwCyYyK2Qiuf
   IvkUX7H+YOxojek/dG/k64V3Bd8Dsjot4dt0cTMwSyM5qWY3LCZ3LlrJN
   Z5TwvCho7CZlSxG4t+XM5lVbIfgtK9a5WB96KW9zqDAe4SrB8VdkpQ136
   32Y4Pf9QJKCXYyZGfE5nB4fVRRw8eCxha4TY8B9tZgSzu3wOBmzQ5VOoK
   SNcZApJLrUTpf8JIoes84gayplFIqfcXTiAoiK5fNEI3MwFxpghnBWql4
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,134,1643698800"; 
   d="scan'208";a="154254197"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2022 05:55:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 24 Feb 2022 05:55:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 24 Feb 2022 05:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIPo9lyYUniMtZ7v9QyjvYzabbJ7ATwCKwtM0ecnCKJtG5ToJVkGhFd//ruJ3IF0rClnzXWkZ74YSmCfqI6lJm4C0ZK5NL9iZbDmpYAuoenhPt5vlYdhDY/YyU0BN1OGTVL+6v4PfipHNy40FXgoBhQ3gqjquIubC7yNi/NVbrqVkQ76uuHbj+6BZTx1OBl/5MhxqNBYtSc0Dw088gazeh5tSIbUGysEeRPlip+fepiH/Matd5W7In7+QyqpMmMhscrvwpn1m8uwskIAJicdD3ixH68wdg27zH05pqNIWe4cTlvx9B9skSJhDeusz/+7tMRQW3q2UU58WkU3T6JeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydZkFukMfFYXEUPagCISDIow0TuUnGvkgIxdumTRpY4=;
 b=hH+wdlU8QRsVO2lMcA9yBBDj4lcnKYP8Lz6nI8D7zqFn2td1ywDZHkKhgniiHlvXY0466m+NH3jfbceiPZBUxDda3Wc2pyRVO+cAEj2hM/kl1p9IgKGO4aZ8uVwA/QAf+KVo1r10RKcLTsHjlcShriY3lQ+rcNh68AUGYYf8iAVeuSgtpDC4jRsHbWrVjY8hWwoO52XVe18P3tOKyNcskp+I4LdliUm56tjp9lT0AJHUZd5ca9+S/ioOVJEYE79c51i9ZuOdoq6holppfntv4rnk36YJXwLGKc7HY2eHloklemO9a5ehk8p/5zVDcaq4ArVlLIccrEl101qn6UQewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydZkFukMfFYXEUPagCISDIow0TuUnGvkgIxdumTRpY4=;
 b=O/rbAPlFNnoNkYS/vziKynSKVGIG2Q/YpRVfP+VNY7qovnyciEk23LPxNrMGkENYlj0auHLGsrQb+3f2fL+SPWbf7RbC8KWGr9oRBBx9BbaXAwwhJSCZ4gDNOdqQwtnGkeFmn7a4I3uSA3QXP+3GF52BFaKdKRiYEdVmrsMemK8=
Received: from MW3SPR01MB0001.namprd11.prod.outlook.com (2603:10b6:303:40::7)
 by MWHPR11MB1613.namprd11.prod.outlook.com (2603:10b6:301:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 24 Feb
 2022 12:55:26 +0000
Received: from MW3SPR01MB0001.namprd11.prod.outlook.com
 ([fe80::8d51:7fd5:9f66:581a]) by MW3SPR01MB0001.namprd11.prod.outlook.com
 ([fe80::8d51:7fd5:9f66:581a%4]) with mapi id 15.20.5017.023; Thu, 24 Feb 2022
 12:55:26 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>, <wsa@kernel.org>,
        <Daire.McNamara@microchip.com>
CC:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Thread-Topic: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Thread-Index: AQHYKXp8xeT2UpZeUkiR/IYLPphk2ayiqZsA
Date:   Thu, 24 Feb 2022 12:55:26 +0000
Message-ID: <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com>
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
In-Reply-To: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6597ac2c-f7c9-4c39-6b7c-08d9f794ed8b
x-ms-traffictypediagnostic: MWHPR11MB1613:EE_
x-microsoft-antispam-prvs: <MWHPR11MB161318DD67AAC7E4E994DDEB983D9@MWHPR11MB1613.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjJeBEM8rXEv2o7veDtjJNuvsEMb4cVgrSuBDrGNq6RAJpMFkY1/N6eQffQN+rj8SO7+xJe/OUc1z+OE1/xImcPHi9eaHuMEQ2xlV57nge8xZwIguCJCM7opWBuaiFQOyjfiNAqGwqKC5RdrSWjSkwWy/6fzWIzhqDyo/P6UtRM21QHb2PrUkl9AFseo9TNoSbPvOj/wDGbx6cY8dHi7ZGQ1auBBna5mzxwnkp/g8mvB2rULJObAnwC6SONWgXGmczYUDwDgMqNffKn7zD9fLLjTYpZaGRQmrQ827pLxxfw/rdZzp5rWJaloJ9uQ8cmek45icC+uabnD52Ri9r3yjTe+obqiWpPTMvVfc+u+NwIMK17GuiWgI3PVn0VvRw6eCD33lXiVsbgVBIWTBWcnPCBh9v2bqc+mYL/r3WXPuGhdhazhVDNiCE/pMTMKeeXmYaRym5kldcn2Xo2DytBnQjRUy8pZj9Y0VYFwS8d+ZXz5M1k+l7ii4+xUk3s2S3uG3xP9VS+SUhy41xTrOssRClSkaBzophKYbaM0PBDo6uvdbubPn6WBuQSbDCaAoRKF0C0e5WnTYiEzfGKFQy+vflfHrYmtUqFnQJgbjgH3k5gt6DWJOQQ1FO+4bz8Ky/mDDUqMsOK2OLt8Ylw42WqW1OKeMiGK1ecmhfqjVHRj4ucGfTLnBzKkNxlF4Ndh8GcWgwF5C2f6hl+guRabDjXqAuEMkWWEn3+8WCOVXSmS+vqFamTXuSWI1ClX09y9fIk6IqbgGRpZ0T2b6nb9uMmIiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3SPR01MB0001.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(53546011)(122000001)(26005)(38100700002)(8936002)(186003)(86362001)(31696002)(2906002)(6512007)(38070700005)(6506007)(2616005)(54906003)(110136005)(6636002)(36756003)(31686004)(508600001)(316002)(6486002)(71200400001)(76116006)(66556008)(64756008)(8676002)(66446008)(91956017)(66946007)(66476007)(83380400001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0ZUTVpQR2tNNUw1eDltTFhyekRxZmdSRjMvQk54dUVVbVc0S3c0bThBWjhj?=
 =?utf-8?B?eG16aHlwS3d3aXcwVzl3ZVdVTmsvaFdrWGhBLzV2b2FUWHZMNUpPakN6RVlY?=
 =?utf-8?B?R2dlc0NYZU5DUlV6ZU51aDFjakdJc3U5aENNLzgzUEg0SlhNc01SbGpXTld3?=
 =?utf-8?B?SGh4ZFh2bjdheUM1aVlmNm1BaHZXNlBJSW14OEtMQnUzK2tBMmlnQkRJOEpv?=
 =?utf-8?B?RVo1NUFDUENuU3RNbmRtbTFWbmFEZlhRY3NZeU9qODR4OE5NUy9hZDh5dHdr?=
 =?utf-8?B?dExCQ3RzM1FpQjJsa2dqZ0crM09VN3VwdzVCQ3laQmFFMkxYVC9NMHREV2E1?=
 =?utf-8?B?YjdTY2NQSUlhTFhvaG54ZEVsTnlNWEppWStyVmNGOTN6bFgxcGgvd2xadGtO?=
 =?utf-8?B?MzVzelovZmw3aEo3TWFJZG5hK3ZRam9JWG9zV0hodGFUUGw1TTU3dWJhM3Qy?=
 =?utf-8?B?QWNaRVZyRjJyZGZwbTRMcHNTcjhZOEFVR1Z2cmtQNGladUlrT3ZFS3Z5K3RZ?=
 =?utf-8?B?Y0pJMXU2ZHF3UHg4N05FM3BsRndJMWJCa3RZMVNKN2JscXJTTVN0TjAyYVNO?=
 =?utf-8?B?cEs3RW0zNTgvVnAwM21QcmhRSUlQZEJINDJVdzVhK3c1djNveGM2SlpXTFZ1?=
 =?utf-8?B?NkV3Nm9ONFgzdHVlL0pjc3hLUGFJckRkNjZsN0w2VFlMZ0xrWHNvdXA2N3Ny?=
 =?utf-8?B?RTBKY3k3cks3ZjhxTmlpb2tZbzlHMWQ0WnFTQXVDZW5NdlZ2RG5SaTkxSmpT?=
 =?utf-8?B?YW5FWVBQVEpycnludVoxTzNYSXpPRXpuOW1SSllQRllvZUFCZ2tVWmNkRFFp?=
 =?utf-8?B?WTRPZ0s3VXBKalVudVNJcCsvbmVheWRNT0grUVhpWUpxcEhsd0dpMnV5T3Vn?=
 =?utf-8?B?N3hMdlpyQVZNV0kxUXFpZjF4MnRUSURUcy9scUZ2akhmd3JacWxEcCsxbWYx?=
 =?utf-8?B?akgxVHdCTTJaa1dWdHZrSW1USk1KMmoyaVFpVndzTGJ4QXZJL09DZGJPN3ZL?=
 =?utf-8?B?UHlYVFVDV242V1RsK2xSRUh0S2ZlOVJNTzQ5S284aEEwMTY4N0xQUnJ6WkVO?=
 =?utf-8?B?clRvaUNsMkxrYkR0OWpxVkdad1B0dzgxK293ek1RR3RHdWUxa0tVSC9TWkRD?=
 =?utf-8?B?czNBZnpoRWZXMWVuaGFGNVYveThITGdWanlKL1pxeGxZQ3RuK0ZyRTN5VXRT?=
 =?utf-8?B?MSt3NVIxalZ3RUdTUlorN09iT3RMSzVnQkU5bVAxVnJ4SmtIQ2NrYURGeklE?=
 =?utf-8?B?QkN4QkxPMkNJN2RwZ2pDanFNRXN6ZnJLRTRDQjd6NWlPcE4rVFVidWFnRCs5?=
 =?utf-8?B?S0JoV0VOR09QME9hQVJUOUdFajc0ZHpkcnl1VklCZWdTMjFDVnRwbzlka0tO?=
 =?utf-8?B?enJCRGU1YmVhVm9VK2IxQ0VucFppbDZ5YzdueitaK25YYlhYYW9RM3pXY0xw?=
 =?utf-8?B?VFhBTG9lemkrTHhLYjQ4OHM4bnQ0VGp5RmlaMnpka2g1SFZQYnluMm03YUNB?=
 =?utf-8?B?NmdyYkV1R2ZlZ3NNR2ZFaTFSWFVLcVNLOXJ6YWdRY3NrSHdVVVkzVXl4VWRq?=
 =?utf-8?B?YXV4NUlZWGNoRUl1azJGSWZjNm02ZlIxclFUK1BFSTNKYnJaZ24zVVlibWFF?=
 =?utf-8?B?eitISXE0eHF3Z0ZQUnc5dUQ4TVlaclorQ09jWC91dlk0b05XQlNiR202Q1ha?=
 =?utf-8?B?RzJwWDFSRHFqaUVzb2ZQZi90bFErNGc4V2NRM3hvaWRYcXRPYWVpd25WQ21Y?=
 =?utf-8?B?U3QxYjVibTR2eHhYOHhLRDRXdEp3dWFnazUyR08xSFRmaDVJSENnM2NTL3J3?=
 =?utf-8?B?NmhpdVRaMzVFM0RvZjdYSXpXa1RxNVpudnlrekQ2alUrckY4cXUweXBBc2xl?=
 =?utf-8?B?NllMTTdoTWNvQjQxL0tvL3ZyR0lvbE8yQy9ndnZIQU02R1dnYk5hWXQzRHV3?=
 =?utf-8?B?WDFjeXhJaHo4UzJNK3VwV0Y1YlZTMXpSSHJXOWF5eDFBVFNyY0Q4L045cDFn?=
 =?utf-8?B?ZWdscENUNGNhZWNMRjRqU1NPeDRraTJpTlZGYTc5WFdTVmpsQmcyL28rZnBa?=
 =?utf-8?B?VWtheHVSRzNFQlpjeGFtRnFnTnVhVUlESkZrcCsrZDg5aU82NlJmMFhCZnVa?=
 =?utf-8?B?WWtMNm10SHJETk9URFBaQ0cyWktnbXNqaGE2bThKdEJldWszbnNYVGN2STJo?=
 =?utf-8?B?L3g3QmxYNVliU1VlTVRPUWN1Nm9rMEVyUHVwRFpRdEEzdUdRazFJbktrWkMv?=
 =?utf-8?B?RkFOR3pUTWNqbjNNcER5bmJUWXRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB13B91F8C41934D9967FEBF2A318189@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3SPR01MB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6597ac2c-f7c9-4c39-6b7c-08d9f794ed8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 12:55:26.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /i/A1ooDQEbar8DM2uRyPGUPIRpjz1o//B4Sz414qcRbIoI0vv/IH0JkuVYRtNrlckLanTqCYBubVk4LxoqAqNafW+wnnwdeZouBlXePwlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1613
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjQvMDIvMjAyMiAxMjozMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IG1ha2UgZHRfYmluZGluZ19jaGVjazoN
Cj4gDQo+ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9taWNyb2No
aXAsY29yZWkyYy55YW1sOjE5Ojk6IFt3YXJuaW5nXSB3cm9uZyBpbmRlbnRhdGlvbjogZXhwZWN0
ZWQgMTAgYnV0IGZvdW5kIDggKGluZGVudGF0aW9uKQ0KDQpIZXkgR2VlcnQsDQpJJ3ZlIHJ1biBk
dF9iaW5kaW5nX2NoZWNrIGxvY2FsbHkgYnV0IEkgZG9udCBnZXQgYSB3YXJuaW5nLCBpcyB0aGVy
ZSANCnNvbWV0aGluZyBJIGFtIG1pc3Npbmc/DQpUaGFua3MsDQpDb25vci4NCg0KPiANCj4gRml4
ZXM6IGYxYmQ2NjYxOTQ2YjIwZDEgKCJkdC1iaW5kaW5nczogaTJjOiBhZGQgYmluZGluZ3MgZm9y
IG1pY3JvY2hpcCBtcGZzIGkyYyIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvbWljcm9jaGlwLGNvcmVpMmMueWFtbCB8IDQgKystLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9taWNyb2NoaXAs
Y29yZWkyYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9taWNy
b2NoaXAsY29yZWkyYy55YW1sDQo+IGluZGV4IGM4ZTYwNWZiYjhhNmIzZDAuLjdiYWQ0Yjk0NmEz
NDljOGIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvbWljcm9jaGlwLGNvcmVpMmMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaTJjL21pY3JvY2hpcCxjb3JlaTJjLnlhbWwNCj4gQEAgLTE2LDggKzE2LDgg
QEAgcHJvcGVydGllczoNCj4gICAgIGNvbXBhdGlibGU6DQo+ICAgICAgIG9uZU9mOg0KPiAgICAg
ICAgIC0gaXRlbXM6DQo+IC0gICAgICAgIC0gY29uc3Q6IG1pY3JvY2hpcCxtcGZzLWkyYyAjIE1p
Y3JvY2hpcCBQb2xhckZpcmUgU29DIGNvbXBhdGlibGUgU29Dcw0KPiAtICAgICAgICAtIGNvbnN0
OiBtaWNyb2NoaXAsY29yZWkyYy1ydGwtdjcgIyBNaWNyb2NoaXAgRmFicmljIGJhc2VkIGkyYyBJ
UCBjb3JlDQo+ICsgICAgICAgICAgLSBjb25zdDogbWljcm9jaGlwLG1wZnMtaTJjICMgTWljcm9j
aGlwIFBvbGFyRmlyZSBTb0MgY29tcGF0aWJsZSBTb0NzDQo+ICsgICAgICAgICAgLSBjb25zdDog
bWljcm9jaGlwLGNvcmVpMmMtcnRsLXY3ICMgTWljcm9jaGlwIEZhYnJpYyBiYXNlZCBpMmMgSVAg
Y29yZQ0KPiAgICAgICAgIC0gY29uc3Q6IG1pY3JvY2hpcCxjb3JlaTJjLXJ0bC12NyAjIE1pY3Jv
Y2hpcCBGYWJyaWMgYmFzZWQgaTJjIElQIGNvcmUNCj4gDQo+ICAgICByZWc6DQo+IC0tDQo+IDIu
MjUuMQ0KPiANCg0K
