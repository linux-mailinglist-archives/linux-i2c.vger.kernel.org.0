Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878DA4A7356
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 15:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234546AbiBBOhr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 09:37:47 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:58172 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiBBOhq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 09:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643812665; x=1675348665;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=57yls2ZQ4nX7TU+zD54KwgDSVCUIcI620T2rGqYpO6U=;
  b=thdVaNd/EV1mThCjLvqu1rsufWtSLMs5usXk2oiPkpYn/hUGZYY6CfKr
   xOjYikogZdbObnbgO7EbNBycJLHBCQ5o0MUn6maBa/9coQKee7sDMVwBK
   Bladnvxw4RiIzwwfqPzQDjR7q1TK9nKd57RrVL7Lwol2B0BRoOxOyCHty
   QM74T59k7tqqis81eKgPtOV8VQG9n7j10ZxibDtFiTyADTixeN6rf4cLi
   q5I8mtQmwxPexKnBbJ8ZVP4/Z8Jw+FC+HJU6yFIN804TILkerEqPdnXQY
   s6m2wT6L+zUaXHnVspgqWb/IAnnCmj9EmI73FD6LPQ9T1cJlYAn/XvA4C
   w==;
IronPort-SDR: 0h4WlFBZgD+xtPNhCJ5xOs+X4eFw3WH07cgD0eWo0iPfsDOwq8RkdbX6XGg6QyPU17fof19JZ1
 tYzQV+5fqxnNOqafiGsLBMHjqQJJdNArx3RPmo3NyZe/pUmn+TxOH8BG5Ud7+1Q1gloqNtX/O9
 edWwdCOKSIElut9ZJUApeP64Ia0TuTWg1ASRIJy8N2pd8oZL+lCzD7jq2bhlEPDRT1hSnBGKkb
 RVCjok8C9jKhU3dFUEz+FOKazPXmVOUuGy/RkzHhLtj+sO/2EokvuezW3cBV9d/glqnJImueLa
 Gl0UdNS5pP24JNGPl8NyIRh0
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="152239879"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2022 07:37:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 2 Feb 2022 07:37:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 2 Feb 2022 07:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbD5j7Va0jieOzbPw/W+uOQMVfP5f9T/mgyFyf+UYmOgfFtjUh7z+izSHKjhUBQRy6YX6IWa7rjZSi56uyACipnWAA3n8jZHmYZ2KwM/SozD3j65qBaUwcChhxpHF29KA/PIwLTFN5LSkAArDJ+RsQ+u9FnIxoTovxFoRxpqdi5vxEFCNtPQlceiN1TkYeX1B09p37KUdCBsEDnSmt8NWx4UxV9t0y503QVxbHlQ2zFWWvy75cDFhHYDupyUYGSjQ+/TWm+WZTY3pHWyaI0TlqOzR60sFGan8Ed0AC22/M7Txvc5CN7SnoDGvAN+6QUeDIJoChaWooqt0kf+l+EnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57yls2ZQ4nX7TU+zD54KwgDSVCUIcI620T2rGqYpO6U=;
 b=G/9vdWomKSnFj1Yv7+MVjqau/HUPTnlaSy3e9Y/ElQzfmn4lTI9+S/IWpDR3Fh5++z+EOCVuZmu9cfwvbTZOwQbXdQi8O1dvO10a7FlJDCt6NWLr1pTWDPakLP+KUDxZNKfL2RwhANJDPCHhtNgeRmMy8psN+wuwlmSRJhjLqRpcyDlFqPfUZoVQ9NFT28DH37ZfXKhErh04iuP/FC4WYooSgahgQQiwyzzxH4/faxzxkzWIok/b59unGVgL022llf/rwMXLkBkkuNgM0YeH1BaJApUUJepFjzDkMyuaYtyTEVzAlQGTfVhGghXQ5TGf5LnqBylU2blrjG1xKeh6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57yls2ZQ4nX7TU+zD54KwgDSVCUIcI620T2rGqYpO6U=;
 b=alweH/24/idmRH7Gny2TKgr2cBTdDTH3gPo8q8ivQbx58UNGybtVj4CB9KHfkkaw6y3vqzyw4CefAFWooLvtPxZ8z1+zCNV9EYUB+2hz5vnTRNlANAga22GgaCWsrvSBij2CTFYq6rwV6gQpfTOwoNTwT2DgDm33JNigFld1rzw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN6PR11MB1427.namprd11.prod.outlook.com (2603:10b6:405:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 14:37:43 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d174:473e:7192:543e]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d174:473e:7192:543e%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:37:42 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <u.kleine-koenig@pengutronix.de>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <aou@eecs.berkeley.edu>,
        <atishp@rivosinc.com>, <bin.meng@windriver.com>, <brgl@bgdev.pl>,
        <Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
        <heiko@sntech.de>, <Ivan.Griffin@microchip.com>,
        <jassisinghbrar@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <lee.jones@linaro.org>, <Lewis.Hanly@microchip.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
        <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Thread-Topic: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Thread-Index: AQHYFpguO8Zyz/xVrEiGcM08rif7Sqx+VckAgAHf0QCAAA7TAIAABcsAgAADgICAAArLgA==
Date:   Wed, 2 Feb 2022 14:37:42 +0000
Message-ID: <fa747594-a112-d313-5de3-2330bf5ddc8a@microchip.com>
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com>
 <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
 <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
 <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ee67b0f-e8bd-4dca-8c30-08d9e6599236
x-ms-traffictypediagnostic: BN6PR11MB1427:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1427716CD16C43517BA8581098279@BN6PR11MB1427.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9LZy19Y5c5awtfx1K3scmHa9u97AUNphpYIbIdy2dV+etNj5xmXNtfMGNxfaMbS83L81q+MdoEDDmc0+rAKjbKXpeAFkSt7k/DI+88/wymjfTeyDyBeV1iiNHnPJFRuQtsctxO8SMfg5Uu2FK7/EkIQZL28Uf6my4qxr8386CtnQGMDXa3J8CqbFRxHiNJqS4GNLMkIWqy02nkFQi79pRbN5VS77yinDt8oPlp0MesmXJ48M5Nx25wxMVh9QBUvh81FsB2+4Q5ChPsYCImYWwI1DmXQYF/mg53PSPkwLBIRhwQZ+Cu4zwlgXB/RlClWT6mPVB3e3wvz4JdHmoeeoq4hCTRdPvnXC4/LW6VfgCJSspwEL1deZuebXXINr98+7F/gq4MnTkOqPE6d/FfJZsfNuzNeateU5T1JIh1SZKOknDgnOqhbv3w+iecEkYzNqYFToLjKkCK4kZhuIHs3UFpPStY43dJr5HoWZWJk5/9PiClv+UMR317lEqITQWz1LkXdggXZy1nAp1IKXKowqpNhP6uKNm+i8g1QHZ7YI7YogUJBUMxTDsBijvwyMNeiBedSjT77FPE3FX124NhEg2D+wFZLRCXt5A7m3V7uHLXd3Nequl61/DF8mIp36XIf6eHGN9FOb/idF2x0ae4ufmdaa1jHCXllE+agN+91g67pFN7gXkI7Ah9YjqJkr8xzCElbKqBov6bKwJ8V9c1YbTR/FuqQzCXHCuLEtEZ6C8PXzUKA7/5rUZZRZhm++0U0IKZCEFL6/jkldP5iqdc2jQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(2906002)(66574015)(38100700002)(2616005)(71200400001)(53546011)(36756003)(7416002)(122000001)(31686004)(5660300002)(6512007)(76116006)(8936002)(66476007)(66946007)(4326008)(38070700005)(6506007)(8676002)(508600001)(91956017)(83380400001)(6486002)(31696002)(26005)(54906003)(66556008)(186003)(6916009)(64756008)(316002)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2FNNUl4bnZqSWxzUWYwSSsyaG85R1ZEVmRSTy8wT0FpaWdOdzR0OHlpR0JQ?=
 =?utf-8?B?d2JDd0Z4RU1KYjczb1loYWpzbDlGK3p4V0JDU3RZaUd0czJPeHFJcWw4aExW?=
 =?utf-8?B?ZEg2dllBdktyMjRvcmc1Q2x3RU1zeUNNVHJqZlFQLzZ1NUJJRUk3TzZSVFhI?=
 =?utf-8?B?Z2oyQUp2UklyMWZjNHh3MDBIQ0t1dHRXRkhxd0NFRVFBeDI1dkJycms3dllW?=
 =?utf-8?B?dzlBYmVVYXZybTJrMGY5L0RiSy9PcVJZU0lHWGdGQmo2QjRtZTAyVGdZWDB2?=
 =?utf-8?B?Y1lpNElKa2VGVUxYMW9RYmRxTTBscVc4RUl1dUYvdlhyVnYzNGpiQm13bjFr?=
 =?utf-8?B?cHQ3TVp4alFOZWFWZGpuYTZUbHY0YmhXbHRobDJlYTZxSkpJWStLY1NucVln?=
 =?utf-8?B?amdnMmtYYldJZzRCQzZpd2tDYkZlQUNpZGJmbkp3dmI2YnlURm4zb0loZVNQ?=
 =?utf-8?B?ZkNjQWJhSFlHZjJmaVlWem5WZVppYkdtWDQ1dlpaczFJaktlVXVNOUFKVlNG?=
 =?utf-8?B?NEh6L0Q3Q0t1b1V5MmtVMmpUVUlMNVlqKzlxdFFHNFd6Zk9rV3ZEbjRpdDl4?=
 =?utf-8?B?SVJLbHM0bFdibDV0dVdOLzJpb01QNElpL2s4VEY3TlM2RGdTSFdLL0VQTnRn?=
 =?utf-8?B?UDVkRWFad1Z2RkljV0ZzU0JwRzR1NVVHOGlIV3VoaW1sMXlBTitCR0gzWkdS?=
 =?utf-8?B?cnBuRFhEamhENlJPV0dWckVMVU51bDJ0Ry9aaGpTOHVkeXBkS3F1WXVGbExY?=
 =?utf-8?B?cnZ2bnNCaUN1RDhSZ2pQKzlIS1ZsYktiYU1Va0k4eDJMak9CTXhvQ1ZiTE9J?=
 =?utf-8?B?bGwvR0hFMFhnY3ViYzVGMmdHVU9JQzB2RTFRUGIwY1c3TkJIejdQdkptY0dj?=
 =?utf-8?B?QTZrSHRpNnUvTG9HSUpibWoydnpXWmdmWVFTSmM0ZDVPd3VjZm5DcFZycGZl?=
 =?utf-8?B?SndGTEtLRzliZk13T1NMZ3VuNmJ0NWh2YzVkNkxYWjZ5aE4xVXdmQ3c2SWE4?=
 =?utf-8?B?UkptQ0lidGl5VzArTzVDcG5IOE0wWmpsQ2ZJM3l1VlU1L0pFcHo0SlAwMUha?=
 =?utf-8?B?TVYreEJvcklDM3dwM3krMnB6MjFza3RoVldLcG84Sm03NTVqWXNPVGxkNmRt?=
 =?utf-8?B?WlFPdGcvYmcxaytFL2Z5VjdGNCtjOVhEVjhsdDNEdGYzK2diSWxURDYxVE9h?=
 =?utf-8?B?RUhqUFpGT2gvM2hDV0d5d0dwR1ZydWhKOVBIYVV0T3ZGaHVzQTk5UW1nNFZo?=
 =?utf-8?B?YVhrV1JkdDNoRTkyMkI4VjZWL2lkNEo4SDcyVHhqNitFbFk2WjF2QzJZOEkx?=
 =?utf-8?B?cXRZSEhJejk4V1J4VzY5SkpJU0l3TytFS3Bxd3BTL1dxTzgrYWNqais3Ulhm?=
 =?utf-8?B?UTFlVXA5bEFncWdSVDZBYU96VEp2YVFoMit2WTdscnZqN0c2SkJlaTQxeXdJ?=
 =?utf-8?B?RzRuSmRqRHhabjg4Q0lSRzRKTXRkdW5SbExQakt3SG5hZUI4dG1zaGkrYSs4?=
 =?utf-8?B?d1d0WTBCSytOV0UvZmIwU3hwaGJiWEFidVpMNjlTd0RodGtLL2ZQNmg3QzZu?=
 =?utf-8?B?NUk0OXFUdVBlSDRMdEVDSzV4NnZpRUtxNGVrUWNvTVh6OVkrbVlxNGJqQ3ZO?=
 =?utf-8?B?cFhYR2Y0NVdKbWIyOE9KSFVocU9BVlJrSnRCY3FGNGZwQ0ozYjZ0RDJFNFlX?=
 =?utf-8?B?Qk9oOFdlQkZ1eEx4VTd5Rmx1K0cwN3pvWVBYRmNlSU5kcy9Ha21iWVdEQWdo?=
 =?utf-8?B?V0lpN0V5cEZuY1Z6MUFWVERkRWxRLzB5Z3Z5MmV5bFlvMi9oU3FLSysveVNv?=
 =?utf-8?B?bnJTV2hlY2prMU5oaDMzcFJpbFlpcG16SlF2QXR4UVhKT2dneWg1QzJtNVVX?=
 =?utf-8?B?V3hEVmZRMVpZQXVLZ0h0cGxqazIvcWc2eEdOVWw0STNxazAxaktxSEdOMEpM?=
 =?utf-8?B?aHB3Q3VieitvZ2c4Z3NQc1hUaVd6dHZiK3hPVWJvbmdwKzVsWEVZcGp4MHVq?=
 =?utf-8?B?KzlBNDRNV1hiY0tkcU1rZGg2NHZaTnN3ODhFM2xySW04QXVITmRncFpBZkFZ?=
 =?utf-8?B?MVhSVkpHbloyZ28vcTl0WXcvRyswRS9kSjNsUEpnWC9Bd3JBV0ZaR044YlJx?=
 =?utf-8?B?N01ZQm0zNXp4TWhXc0NJVGN2VzBYNVZmejdqcktaVXpVUlVadUUya1dWOVVG?=
 =?utf-8?B?ZW9KNnhnejZQajdObXhDeXNxT1RKM3lib0dUNlBZSWRyQ0xGZVRMUmJHNWF5?=
 =?utf-8?B?MXdQdlcwcFJ6Zm1aaXRuZ3dWblpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFB48FA109A5CD45AE9FF1CA5C65DE98@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee67b0f-e8bd-4dca-8c30-08d9e6599236
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 14:37:42.7912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0SgogOuDzzQhCYS8HxtqaJpe2BojY7FQwwN7AkDyqe9Xk976VqFr2Fkeezygp8aMMcgA2G1ulxV7JdSdfVPxy545daBevzhDRIdG5+Jgok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1427
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDIvMDIvMjAyMiAxNDowMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gT24gV2VkLCBGZWIgMiwgMjAyMiBhdCAyOjQ2
IFBNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+PiBPbiAwMi8wMi8yMDIy
IDEzOjI4LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+Pj4gT24gV2VkLCBGZWIgMiwgMjAy
MiBhdCAxOjMzIFBNIDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pj4+PiBP
biAwMS8wMi8yMDIyIDA3OjU4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4+Pj4+PiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+PiBPbiBNb24sIEphbiAzMSwgMjAy
MiBhdCAxMTo0NzoyMUFNICswMDAwLCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToN
Cj4+Pj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0K
Pj4+Pj4+DQo+Pj4+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgTWljcm9jaGlw
IGZwZ2EgZmFicmljIGJhc2VkICJjb3JlIiBQV00NCj4+Pj4+PiBjb250cm9sbGVyLg0KPj4+Pj4+
DQo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+Pj4+
Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IC4uLi9iaW5kaW5ncy9wd20vbWljcm9jaGlw
LGNvcmVwd20ueWFtbCAgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKysNCj4+Pg0KPj4+Pj4+
ICsgIG1pY3JvY2hpcCxzeW5jLXVwZGF0ZToNCj4+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+
Pj4+Pj4gKyAgICAgIEluIHN5bmNocm9ub3VzIG1vZGUsIGFsbCBjaGFubmVscyBhcmUgdXBkYXRl
ZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBQV00gcGVyaW9kLg0KPj4+Pj4+ICsgICAgICBBc3lu
Y2hyb25vdXMgbW9kZSBpcyByZWxldmFudCB0byBhcHBsaWNhdGlvbnMgc3VjaCBhcyBMRUQgY29u
dHJvbCwgd2hlcmUNCj4+Pj4+PiArICAgICAgc3luY2hyb25vdXMgdXBkYXRlcyBhcmUgbm90IHJl
cXVpcmVkLiBBc3luY2hyb25vdXMgbW9kZSBsb3dlcnMgdGhlIGFyZWEgc2l6ZSwNCj4+Pj4+PiAr
ICAgICAgcmVkdWNpbmcgc2hhZG93IHJlZ2lzdGVyIHJlcXVpcmVtZW50cy4gVGhpcyBjYW4gYmUg
c2V0IGF0IHJ1biB0aW1lLCBwcm92aWRlZA0KPj4+Pj4+ICsgICAgICBTSEFET1dfUkVHX0VOIGlz
IGFzc2VydGVkLiBTSEFET1dfUkVHX0VOIGlzIHNldCBieSB0aGUgRlBHQSBiaXRzdHJlYW0gcHJv
Z3JhbW1lZA0KPj4+Pj4+ICsgICAgICB0byB0aGUgZGV2aWNlLg0KPj4+Pj4+ICsgICAgICBFYWNo
IGJpdCBjb3JyZXNwb25kcyB0byBhIFBXTSBjaGFubmVsICYgcmVwcmVzZW50cyB3aGV0aGVyIHN5
bmNocm9ub3VzIG1vZGUgaXMNCj4+Pj4+PiArICAgICAgcG9zc2libGUgZm9yIHRoZSBQV00gY2hh
bm5lbC4NCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MTYNCj4+Pj4+PiArICAgIGRlZmF1bHQ6IDANCj4+Pj4+DQo+Pj4+PiBJ
J20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LiBUaGlzIGlzIGEgc29mdC1j
b3JlIGFuZCB5b3UNCj4+Pj4+IGNhbiBzeW50aGVzaXplIGl0IGVpdGhlciB3aXRoIG9yIHdpdGhv
dXQgdGhlIGFiaWxpdHkgdG8gZG8gc3luY2hyb25vdXMNCj4+Pj4+IHVwZGF0ZXMgb3Igbm90LCBy
aWdodD8gQWxsIDE2IGNoYW5uZWxzIHNoYXJlIHRoZSBzYW1lIHBlcmlvZCBsZW5ndGggYW5kDQo+
Pj4+PiBpbiB0aGUgc2ltcGxlIGltcGxlbWVudGF0aW9uIGNoYW5naW5nIHRoZSBkdXR5IGN5Y2xl
IGlzIGRvbmUgYXQgb25jZQ0KPj4+Pj4gKG1heWJlIGludHJvZHVjaW5nIGEgZ2xpdGNoKSBhbmQg
aW4gdGhlIG1vcmUgZXhwZW5zaXZlIGltcGxlbWVudGF0aW9uDQo+Pj4+PiB0aGVyZSBpcyBhIHJl
Z2lzdGVyIHRvIGltcGxlbWVudCBib3RoIHZhcmlhbnRzPw0KPj4+Pg0KPj4+PiBDb3JyZWN0LiBJ
ZiB0aGUgSVAgaXMgaW5zdGFudGlhdGVkIHdpdGggU0hBRE9XX1JFR19FTng9MSwgYm90aA0KPj4+
PiByZWdpc3RlcnMgdGhhdCBjb250cm9sIHRoZSBkdXR5IGN5Y2xlIGZvciBjaGFubmVsIHggaGF2
ZSBhIHNlY29uZA0KPj4+PiAic2hhZG93IHJlZyIgc3ludGhlc2lzZWQuIEF0IHJ1bnRpbWUgYSBi
aXQgd2lkZSByZWdpc3RlciBleHBvc2VkIHRvDQo+Pj4+IEFQQiBjYW4gYmUgdXNlZCB0byB0b2dn
bGUgb24vb2ZmIHN5bmNocm9uaXNlZCBtb2RlIGZvciBhbGwgY2hhbm5lbHMNCj4+Pj4gaXQgaGFz
IGJlZW4gc3ludGhlc2lzZWQgZm9yLg0KPj4+Pg0KPj4+PiBJIHdpbGwgcmV3b3JkIHRoaXMgZGVz
Y3JpcHRpb24gc2luY2UgaXQgaXMgbm90IGNsZWFyLg0KPj4+DQo+Pj4gU2hvdWxkbid0IGl0IHVz
ZSBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHZhbHVlIGluc3RlYWQ/DQo+Pj4gRGlmZmVyZW50aWF0
aW9uIGJ5IHByb3BlcnRpZXMgaXMgbm90IHJlY29tbWVuZGVkLCBhcyBpdCdzIGVhc3kgdG8NCj4+
PiBtaXNzIGEgZGlmZmVyZW5jZS4NCj4+DQo+PiBFaXRoZXIgeW91IGhhdmUgc29tZXRoaW5nIGlu
IG1pbmQgdGhhdCBJJ3ZlIG5vdCB0aG91Z2h0IG9mLCBvciBJJ3ZlIGRvbmUNCj4+IGEgYmFkIGpv
YiBvZiBleHBsYWluaW5nIGFnYWluLiBUaGUgYnVmZmVyLyJzaGFkb3ciIHJlZ2lzdGVycyBhcmUN
Cj4+IHN5bnRoZXNpc2VkIG9uIGEgcGVyIGNoYW5uZWwgYmFzaXMsIHNvIGFueSBjb21iaW5hdGlv
biBvZiB0aGUgMTYNCj4+IGNoYW5uZWxzIG1heSBoYXZlIHRoaXMgY2FwYWJpbGl0eS4gVGhlIHNh
bWUgYXBwbGllcyB0byB0aGUgREFDIG1vZGUsIHBlcg0KPj4gY2hhbm5lbCB0aGVyZSB0b28uDQo+
IA0KPiBPb3BzLCBoYWRuJ3Qgbm90aWNlZCB0aGlzIGlzIHBlciBjaGFubmVsLiBJbmRlZWQsIHRo
ZW4gYSBkaWZmZXJlbnQNCj4gY29tcGF0aWJsZSB2YWx1ZSBpcyBmdXRpbGUuDQo+IFNvIHNpbmNl
ICJtaWNyb2NoaXAsc3luYy11cGRhdGUiIGlzIGEgYml0bWFzaywgcGVyaGFwcyBpdCBzaG91bGQg
YmUNCj4gY2FsbGVkICJtaWNyb2NoaXAsc3luYy11cGRhdGUtbWFzayI/DQo+IFNhbWUgZm9yICJt
aWNyb2NoaXAsZGFjLW1vZGUiIC0+ICJtaWNyb2NoaXAsZGFjLW1vZGUtbWFzayI/DQoNCkFkZGlu
ZyAtbWFzayBzb3VuZHMgZ29vZCB0byBtZS4NCg0KPiBBbHNvLCB1c2luZyBkaWZmZXJlbnQgaW50
ZWdlciBzaXplcyB0aGFuIHVpbnQzMiBpcyBmcm93bmVkIHVwb24sIHVubGVzcw0KPiB0aGVyZSBp
cyBhIHZlcnkgZ29vZCByZWFzb24gdG8gZG8gc28uIEkgY2FuIGltYWdpbmUgYSBmdXR1cmUgdmVy
c2lvbg0KPiB3b3VsZCBzdXBwb3J0IG1vcmUgY2hhbm5lbHMsIGFuZCB0aGVuIHVpbnQxNiBiZWNv
bWVzIGEgbGltaXRhdGlvbi4NCg0KU3VyZSwgdWludDMyIGl0IGlzLg0KDQo+IEZvciBib3RoOiBS
b2I/DQoNCkJvdGggb2YgdGhlc2UgcHJvcGVydGllcyBmYWxsIHVuZGVyIHRoZSAiRE8gYXR0ZW1w
dCB0byBtYWtlIGJpbmRpbmdzIA0KY29tcGxldGUgZXZlbiBpZiBhIGRyaXZlciBkb2VzbuKAmXQg
c3VwcG9ydCBzb21lIGZlYXR1cmVzIiBjYXRlZ29yeSwgc28gSSANCmFtIHBlcmZlY3RseSBoYXBw
eSB0byBjaGFuZ2UgdGhlc2UgcHJvcGVydGllcyB0byB3aGF0ZXZlciBpcyBjb252ZW50aW9uIA0K
KG9yIHVsdGltYXRlbHkgZHJvcCB0aGVtIGZvciB0aGUgc2FrZSBvZiB0aGUgcmVtYWluZGVyIG9m
IHRoZSBzZXJpZXMpLg0KDQpUaGFua3MsDQpDb25vci4NCg0K
