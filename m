Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0D334C4A1
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 09:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC2HLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 03:11:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:7448 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2HLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 03:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617001912; x=1648537912;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=y47s1oF5VigaN3yzMJBvR51JRtIwosNY7CmaaKNJEEA=;
  b=PuslRwTU+XW7lqGzoo9YQcWt01jgH1Pu59f8l/xxxC22rlkj+wkT5s39
   kj5jrv9t0A88FZA+RTA9t/fTIfpFFa3MtnCADf3aLzQ1XW6CIRZnVolfH
   25/1eTsBReK+F+fd2+6RtqK25+t7q3y6tcfLzbf1i1eLpMCMtJORWBgrw
   b1pzbyMTYmFjODGohTe1rTlu7ftw1Pe45h9nVm81sEC8uUh8WW53MRoYF
   ECJ4q3BbaRn2itYLSUQaAg8abONfWFbc+S4QWESmx8L4Akx2AOqzOE3yO
   qnSQd1w1OOArn5u4Lx66w6aUIagvLZvQgIRN8AztSdZqoVyHbj3u/L6Eb
   A==;
IronPort-SDR: jPKykIqgrLk90SwwFOrw+Yg9PSEJ/Wf/e/6qj34rfsQ7ZY1RPFWpDLJ9n6/5h6ZgCjxRiKOM0/
 iypEytQ5udrRtfIGSw0AT7GJjXt5grhQognmzmbal+9a5KAKeyhe4SX2JNpym7ge9pmqoaoaMm
 NC9j67v+c5xHOEr5Yssi3JoTMSbKg2WlePX3QlvGeRkxunzteuWmCTJriTHZyd/tqHVNpIVLh2
 ngnquL6j4mClrvnEVr+1ZdMH6acIQrNuIFeCS7f6y+m1Jw8lAfOA9CJ7u1CDDdZxAXXRUkGyuv
 WR8=
X-IronPort-AV: E=Sophos;i="5.81,287,1610434800"; 
   d="scan'208";a="49198726"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2021 00:11:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 29 Mar 2021 00:11:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 29 Mar 2021 00:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7kdiBJhXzrhOBFYo7oJEpBAz9oWeLilSodc2VBJqGxAvBCgq+Uj7HpgmmFBa/CST65BHM3oWJgkF92quv+Oe0GwarTeqGZTyvdlQ8lf9kwKOFo6q4OH3AqLQLjCdZs0BRcytFdInqkvoEfbuBmcxaUhNkNkD34N1ZWvEf33utUVCprbLS0kJ/D/ZRIScmyDAJaO/kl3ISM1B27WDRlNtLXsIh98k7z3nDJMHzEzTucNm5xGtGSjFPVZmQkvZZt7TjP2CwC/utmqDoGvbzMOeZpNib2OKn0Lju5JZmv7FmP7E6ZYlYxV10afpK07A734pZhBbI8bqOYeFnqT9EyRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y47s1oF5VigaN3yzMJBvR51JRtIwosNY7CmaaKNJEEA=;
 b=h5KtTEnjSVUsKjhDL+ds+Gnckq9VLegSYrkbc5wxaGvJUo5AuQ6JeuWh7DtJv0Va+TyqO+5mr+tu8YU40Oe35zEcJ0erHwKXwmg/ns+FYZqSmv18kOo5sFEl4ocxNNZgVBplEHL7Y0627Z3ZGLfRs5GmjV+UHtMzEI0Nuey4WiAqui1ks9bVS0cJs4MXL12QFeUNMdhyldz1/9SuA9D/nJv8TSLhtPhRxndOB+sruyKkFc+ilyryX6K9zFJ0ODqON9Ebl6onyKZGN5alnJHm9siVltbxNjPtw+mtiz67D+CgkUoYQ+A0UE+H4y1Ye4b1KWgapghfCeQFlzElZJm0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y47s1oF5VigaN3yzMJBvR51JRtIwosNY7CmaaKNJEEA=;
 b=t8W7BA5k6gQCc3Xu/pZLZ3+Ko3Czf7Yf+/MXVzzd7OISZdgiHgSdzkPv+kOewJwj4mZXs/0s8GFEu/Rxkls0LKAWrdmdDfTINqbaa1g5cezCT5cDvZUdewKE21GrkCgPj3e8X8d7PoUGR+pOLoOfUgbYkgBeA6UyIdJ4RBKuVSs=
Received: from BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31)
 by BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 07:11:49 +0000
Received: from BYAPR11MB3607.namprd11.prod.outlook.com
 ([fe80::b5c2:d4a5:1758:a56f]) by BYAPR11MB3607.namprd11.prod.outlook.com
 ([fe80::b5c2:d4a5:1758:a56f%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 07:11:49 +0000
From:   <GaneshKumar.Gurumurthy@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>
Subject: git tree to use for new I2C controller Patch submission
Thread-Topic: git tree to use for new I2C controller Patch submission
Thread-Index: AQHXJGrIPgnRIJUHfEuqgxDI08VN3w==
Date:   Mon, 29 Mar 2021 07:11:48 +0000
Message-ID: <d2537b26305bdaf89b427174568accac4c4eaf78.camel@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [183.83.154.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37033067-1f57-476f-b6e2-08d8f281eb9d
x-ms-traffictypediagnostic: BYAPR11MB3254:
x-microsoft-antispam-prvs: <BYAPR11MB3254FCCC61861CFAC7CCED079F7E9@BYAPR11MB3254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtliZjGrtsO2YDjf1h6S6y4JFEPhe39i9lCa6C+M4utD93ZHLosOCIFyYEmhkRZ/wg7CUa23Jn1/2CU9Rmqrcf1LcsNiDOMgwW9M33KODhHSnmSyAlBdt+tVvmFSGdPzLrskCtNu/KMVUi0KzI/b8y71rKuPLHyjzJ9IAvL57XvgGxEaa6b+JCR8uLPpqPHcRHqBVnoXKrI/HR6Q2lYyvZBkaJvWu3xUR22bfCvZZgL2XZs4XUfIeUCSDNfrc82EL4y8D1kWpphWj9vuKZgRLbo7p7VvedWenq/uAKk0QAN/2uPJMXn5gLf+rvvSIhsHGtu4gxvMeOd7gQkEzf9VOoVoyf5AinyqEd7pOjbI+NQZgXpS/xcmFKONbukiJ4OMBkD9Ymt1qQEfOVny80LqM95DC33tQatdq+WXoCsp4j6d+W7N1hn4aL2agqRuZ6Zdxua0+lyR+UFfiK1KzcCb6oXismp6HUkEy9WtJYzm2TkMfmSMmhX3yHThyGEOGEkK8s/Hu7oThy/bfblO3EptiBgVweLcXu0tEOVlPeGV2oR66cywOXeEf8VkCE7qLDiwLFNJXxLseKwJk+2iQ+j9oIFD7VMwzRLKNjz+EKdXwNRL6pPgykokviY3M0IP+FaDO6Wn2eBp2UWK7c67ln8/S/4m8aTSKgu/vE7ICFzDYJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3607.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39860400002)(366004)(376002)(66946007)(2616005)(64756008)(66556008)(5660300002)(66446008)(4326008)(6486002)(76116006)(478600001)(91956017)(6916009)(26005)(38100700001)(186003)(8676002)(6512007)(8936002)(316002)(558084003)(86362001)(71200400001)(6506007)(36756003)(66476007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ajgyRzlscWViWVRvUzRoLzhGYTV5MGErY2E3VVJnd0VrR3lxcWVJcDVqQ2RN?=
 =?utf-8?B?KzMxME41bEtWclZrTW5tSmlCWDQrTmhRYWQzQmRmdHFvNGgyQ3JrenNGZ1py?=
 =?utf-8?B?NUdjaFlqN0RHaFRwNjNXK0N5SklGQUVSOUN6ZVRBdU90aktCbVJrUmE1bW9U?=
 =?utf-8?B?aWlUVS8ySlZuNXcyTFY0T0F0TFo5MEc3bHZ5MDVyWnhPMXdCZU10ckxyMDdE?=
 =?utf-8?B?M1JERUFaOThiclBTckx0YWMvRStId3g1eUFETHZJSkFnZXRSc3NELzFsZmRX?=
 =?utf-8?B?NXFGbko0MnJibXF5eUc3V2RQTzZuTHVYaHJZTTMxSDlQZ080VTY0aTdsZzVq?=
 =?utf-8?B?OHVOb0dwMnJCeXlQRHd0bXRoZ1VJWStGM2pEZ1owZEt0TXJwN1oybllKdXNM?=
 =?utf-8?B?ckVWUm4vTHB4OGtNTU5IVEw2TWN4eHduYXhMQTVHL0VVZy9lelhnYlZWbDNS?=
 =?utf-8?B?UkNTMmpxdGVFcXdvdktmNGdMZnpGMDBHNXJMMXMwWElMRytKK20xdTJvWG1k?=
 =?utf-8?B?OC91OWs0dUZyaTlVTDgvYjR0dktzQWQrSXN0aEhvQllibEQ5bXA2WGdiNWxq?=
 =?utf-8?B?QlZidk5ULzJHV250TVdGNkQybGxLbzZsRjg4eHB1d29RK1dqbHYybUgvdXNq?=
 =?utf-8?B?V05UMURIeFc2bFVXYUxxTTBRVE1XTCtheUxxY25NdlluQjJrWnJXNUJlNEJk?=
 =?utf-8?B?bldCNGhYd2lDdit0bEF3SitnQ1ZDRGppVkIvOUE0RGE1aXhpeml1Ty82cGZD?=
 =?utf-8?B?TjJyWHdWQWxQdytVZnhOZjBuQk0veXE4MXg2OHpLMWFqRDA2VHdWUzNFUjQy?=
 =?utf-8?B?aFRwV2JCNmpFZzBtMTQxb2FvejMwRnpzWFMwYXdjWG5aem96bERndVFpZytD?=
 =?utf-8?B?S3Z1M0EvS29EdWlMMXI5OHJVMHRjRStQOUtKTGpRQzU5MXhhS1F0Vy9wNDMw?=
 =?utf-8?B?MHpKYzFMalM4V2p0STZBbE90TVc3ZWdlUzcvN012ZDJQdEhFUVJzZnZBdlFp?=
 =?utf-8?B?RmthYVdoMmJrUFFPTXU4TU1JeG9MbjI4ODZ4TEV3STNYRTVZdDgyRVV3Y1U4?=
 =?utf-8?B?aHJPT0NZbS9DQ0NMdm1ONktuUE40Qkw2ZCthSGVLUEVORDJaZUZXSHBIL1JK?=
 =?utf-8?B?Y2h1bkFJTDMvN2tjSW9vYkV5bnd1V2NKNEtVOXNRaWl6NGNMc3hyeUN5VGJF?=
 =?utf-8?B?VEQxaHgxVFRmbHZLblhSVGFpSEpNNmY1U1cwZlVacEF2ZEVqNTZvaUI0OERD?=
 =?utf-8?B?WmNSODBPZW90Mm9PYU5FejY1dlVnZDRCTTJLU2Urc051N0N0em1PcHlYcGtL?=
 =?utf-8?B?MXN3b0x3N3hkZTFjbXRoSWNLN1hrUkN1WElVTFQ5Z2dYUDc0a2RoTElrZUMx?=
 =?utf-8?B?UGxxdlVuWjJBM0c3MGlGbktyMC9ZbkwxUkNjRWlpQVNHRWNOYmN6TlkvL1hv?=
 =?utf-8?B?a2RUTnhEQ1pUTnlhc3hjL2l5ZXR4QSswQ042SVRZRHJVc0xDNnBRanFjSHhv?=
 =?utf-8?B?bjZ0NzkvU0wxZnNDU0dUV2dCN2l5YmFHWVgwYUtpU0RUZmZvMCt0eVNUZ25k?=
 =?utf-8?B?SG5HZDNBeGg2dkFVSUt1L2k1RlFnSTZDSm9WVTdOMEcrT0xxUkRsZFpaM2JD?=
 =?utf-8?B?VExSM3JOdlZuMzdTeDRMZ2xoUmNkcENPNFYxTlR2YnFXdFh1NlgvWC9RTHpp?=
 =?utf-8?B?c2VTZ3JyRmhjVElleXFabXBYV1NvS1A1MXhNNHFIZG5vWTF3TENGa3FITjdk?=
 =?utf-8?Q?bUYdmjyHNM1LB0cXpw+SeulaAS5ZsVZPKzrlpOn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <86BF6A6EBF223241B237FBB038308BFD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37033067-1f57-476f-b6e2-08d8f281eb9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 07:11:48.9310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3o8evS7AJ0wnDj7vnWxsXPCHbfiFNSA5LP3bDR1mFaeZhUuzSLBNXRg7JsBKhb9QZSF+ZiFluqcTYbmqiovWmZMUJbCLkQYYAGF6TaXBYPlYOshYudTie0BmFDszcNvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3254
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gbWFpbnRhaW5lcnMsDQoNCkkgaGF2ZSBhIHBhdGNoIGZvciBzdXBwb3J0aW5nIGEgbmV3
IEkyQyBDb250cm9sbGVyIGhhcmR3YXJlLiBBZ2FpbnN0DQp3aGF0IGtlcm5lbCB0cmVlIEkgc2hv
dWxkIGJlIGdlbmVyYXRpbmcgYSBwYXRjaCBhZ2FpbnN0IGZvciBrZXJuZWwNCnN1Ym1pc3Npb24/
IElzIGl0IHRoZSBMaW51cyBNYWlubGluZSBvciBMaW51eC1uZXh0IG9yIFdvbGZyYW0ncyB0cmVl
Pw0KDQpUaGFua3MsDQpHYW5lc2guDQo=
