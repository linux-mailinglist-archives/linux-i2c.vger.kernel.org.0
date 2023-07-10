Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C4A74CCF1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjGJG3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjGJG3b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:29:31 -0400
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com [148.163.137.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567FCE1;
        Sun,  9 Jul 2023 23:29:29 -0700 (PDT)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
        by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A5DP19009891;
        Mon, 10 Jul 2023 06:28:01 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
        by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rrbn9r56a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 06:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2vSc47IM7Ubxkvp2xM//U9AuPOO4pJsZ7gDvslqNMORUjIsyu2oWseznzBc7L5apHJC2hC7++GavCxbYSbE3XvwQpLAO4/uhFkB3ezGlvLnwyFGkHIL2r4bh9gqodpeeHldzRfN4fi6jAFTzca0G2I4HyfTVoHY5KyBv6J1x1g5D/ryz8WCtE+w1fy2AFF5MozxDHARFNj0cweEZvN1WkxRIUO9A01d2tiW6Jb2FXS6WNarPNrU2FEPybcDOdY74jXUsO1sbCmnJvCirWeQFwJgS1t/cfBscYCfCyhzuK6aZxVmHzEbB2dFgy2atkG/WZnBDqW4FKGAHbuWCF89rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNTiyCK4PuY9J3ELIOU/z4Appv0a4E6aEmBgL6MzI/Y=;
 b=Ozk/R7O4oqXYxduJ8P1dKeelxHQzstOqi6Y4IgZBEJg3V7eVYF7L7/bVyVLe/d/8eCtvrqiiVjgDDDB/X0RUISeap4oQSos1j69zCdPdPwPokwrVbifkED4GBR2oXWmCPCxcva7ZO5E5K/LBpC7pJmyMbNg8Dvf3kiBCXwNF66auOVDQxkYH7kvW+V36+Yb0zNiltuDBVyMn1DvBcgun91hgIm6NYJOcAlwBrUX4GW9rvJVBQdiixvjTTOs4f+Tkoq8ll2KLD7bPtjBzhQKMKcv4nAFVwFLMfsiJiMyFPGdDQrh+pNNyW5lZIYtzl9f3GI91QzSSJx7svBLfd96brg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNTiyCK4PuY9J3ELIOU/z4Appv0a4E6aEmBgL6MzI/Y=;
 b=mo8KQEXtfsdi6gGlJAK14XwtRT9AN0aF1P7Et4DwV+0EtNARHvodPHV26RoC9Q33mTuypV+JPu1s2DwuMcLdG+Sedgn3zAdnTBKjv7vkrjkcEwBWfQMzo2UVjJJRDH8tDJzMa0KfDzDze+SFQ7w8NXRpEswMOcyQlsllttPUJMVGY9y0I0sFnW1u47wnn+9rUBn3DqVNL5hDykOl+TbgJ9qwdVLntYkN04hXgCwZly1w5+bN+nYi6vaqUShN66O6q6tPuMG+Xyj9ddfcXyBo6C7+e/rVg7OxhjTS3H9vwpqVYd/BdeO5X+W82rTY5n0zTiwsSHfD0jxFM6Jw2Quzmg==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PAXPR03MB8274.eurprd03.prod.outlook.com (2603:10a6:102:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:27:57 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:27:57 +0000
From:   Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To:     Rob Herring <robh@kernel.org>
CC:     Peng Fan <peng.fan@nxp.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "arnd@kernel.org" <arnd@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Topic: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Index: AQHZr2YotROcBsXjd02uJm3g7CUa76+uVu0AgAAZVQCAAAoQgIAAS1cAgAO53oA=
Date:   Mon, 10 Jul 2023 06:27:56 +0000
Message-ID: <87o7kkxous.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com> <20230707152724.GA329615-robh@kernel.org>
 <87sf9zya79.fsf@epam.com>
 <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
In-Reply-To: <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|PAXPR03MB8274:EE_
x-ms-office365-filtering-correlation-id: af9a0c14-97da-4d3b-329d-08db810ecce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWm3pguI1Pw0RfzesSMuioyJlvHLxp0HjZu6gZNxyUdP9r3/MjSzeZz1/GaJIDQZ6xXJE7ByhXDiEUPnZFLfKvoLswbvajQHcjla0tMb3pndsWm4pQ8mMJxH2nBNVQJismDFucrYJBo0FS0YN7WUJhCz6hiABlUHuQlArwKvBWoVen8IwW3ElTyMG/rJPQrYWzVDE8FGHFlsgHCOm8X9C/ZtboqhcFxXN2I+5Jzncn4MhsGnyptu/GpEjzAvvjbHrCbclHlQbcuaV/G3u/AIzlhBO1slHZ31waYNvmPwWmSBnY5SmehNjeOzXHOpO9QdYmCzfzzPETPSd1qWfpS+e85tO2nR/slYQBAYIxB3x2sT2qfedWBHbfWDtk2jXudQWs3aU+Z16KM28oizC178tre/j9DAFeGfpxuEbxSzOTkCQw1vcv79VywGmEq5F/mrq5ZK9hErVaATX3971+X73zMPcGWBOuMk4UexLNkxbrVi4sxN1ZfdR2MDSu+vhXOeYKzJjXYN5YvveExdD7djfpRNWIGZJL8tU85MgIdqxNjKdV796UoaIyV2bXzbgJI7auNU9J4HmMKx+nB3fNCkTewiT7n7/NYnCm20f3D+HFk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(53546011)(6506007)(186003)(26005)(86362001)(8676002)(8936002)(2616005)(83380400001)(5660300002)(966005)(6512007)(7406005)(71200400001)(6486002)(41300700001)(66476007)(64756008)(66446008)(76116006)(66556008)(66946007)(7416002)(2906002)(36756003)(478600001)(54906003)(122000001)(38070700005)(38100700002)(91956017)(4326008)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFJvZXJhQzFrdHRwcjFkWWo2NngvZDBKWlFVdC9HVHhPS3AvcEFsQXBCbHFv?=
 =?utf-8?B?OWJkTXlDd2laZ2REMGUzRzRIRHJYVmlwWFRkaWl4S1crbHlsK0ZFWFJrd05I?=
 =?utf-8?B?OXBMRkdHZEl2ZzJBQ2ZhV2tLRloxd2xld3VGL29FMWhoZTUxcWtLNHl6ZUdi?=
 =?utf-8?B?RER0RExBNXlDekFEWVpOSGJjWVlxNHRxQi9WM1pkWkROQmlhb3pnSEh0MHgr?=
 =?utf-8?B?OHljNzF3cUZ4VFBEUWZNYzErM200cVV2Zkg4NnkzeWd0ZENncGloZmMwZVA5?=
 =?utf-8?B?MW4zVVJqT2tIMGlNL0hoNkpRUHBNNVZIbmh4TVFDck5LYk1pT2NsbWwxOHhY?=
 =?utf-8?B?UnQ3ZzdMcWx6T2JHR2FPM3pPR0FwWHFidTVuZ2ZPMGFOUmZ5dXYweE5xNng0?=
 =?utf-8?B?aG01NS9kUU8vdTVQVU1DRVZJSXlramhwbjlPeW9HRXJOMEo3K0V3MUFQSGJO?=
 =?utf-8?B?cUFHalluZzZ1V2F6VXMwaGRmdThPcHpReXB6Z09RdEh5VHBQempBN3lJdFR4?=
 =?utf-8?B?Z1RaN3A2bmZrdzFZd3hVS2lMMXBKQTZMeG5xQlBQMGhBRDVLTDJObG9FVnA3?=
 =?utf-8?B?TklqV001dWtFSktzcjlTbmtQekdwWm85R3VxSHdCTmoxYjlYYnhWZjZoYjcx?=
 =?utf-8?B?M0pwbjk5UnRUblFYTG1RWWFsLzQxYTZ4TnBjSTFuUjlNbk16WGJ6VjgzQ3hV?=
 =?utf-8?B?cWsyQ3l5SDBxSEE0dU5FQURqcW1VVGtmRDFWYzY1U1NqV1JvcjFPeFl1dFB6?=
 =?utf-8?B?eTFrT1dkTlpMaUU1RjVmMyszWElSYWg5cTNtM0NxWnJDYjVQaWs0ekUvaXhG?=
 =?utf-8?B?UVRoc0V0cTJ1UDl0elpNN1h4emI1K21jUnhFVlpKRVUzeklrYkQ3WEFUNnc1?=
 =?utf-8?B?ZVd2c2tpY2J1N041SUlNZ0s4QytwUXFPbXNhMmFjM1hxM0dwenNNVDdXTEhU?=
 =?utf-8?B?NXdocVV0Zzdub3F4RE1qYjNUUGpmcEZISGZ6TGlFWGliYlFZV0NBQ0pWcHJW?=
 =?utf-8?B?R0tXUkJsbkdoWXpIQ29YYTRyTkRUMDBacnFkNGxUc0FZd3RsOUxKd1JPbDBD?=
 =?utf-8?B?ZzlBSTY3V1EwaFRBakpFTzJFdVRxR2ZaZGQ3MkRkalBMUTdUbUo0Tk9lWFAv?=
 =?utf-8?B?RDdSaUVUOTlpbmFqSGI4c2VaMis1OWJqK2psYWNLcml1OGFpaCtsd3BlZkNo?=
 =?utf-8?B?dllReDJFVUJxbHgwaDlUMXZlSW5ucGgxeVBSTnhkY08wdEkzQVNNN0l1Y0Rh?=
 =?utf-8?B?ZUJhK21IK1JsUzFscmdBYTR1SzNjSkJyd3ZGcmZZNldYRWs1bW04aWZqWitG?=
 =?utf-8?B?YS9vT09iYU1PeEo5SlA3MDZOMWZJUEUzTFlRY1k3bktrbXFlM1oxWThFdWxm?=
 =?utf-8?B?dlN4QUt5MitWL1R4REcrV04xY3NlUmk5TmU3RUJXVDhVTjNYdkJlQWcra2NX?=
 =?utf-8?B?Z1c5N0czUGduaE5YeEJaejU3cDVBSE1yY3hrN2lDV1RVTnRJQ21GOHo1VzJv?=
 =?utf-8?B?ZVMxUlpRbHEya0s3enJucFdRSlNyZ0IzVkdQTkhxUXRXZlBxc1QwY2lwSExU?=
 =?utf-8?B?ckc3aElOeEF2L2NqR0F5Nm5hU2JuWTNCSDBVQ3FuaHZZK1NFWFh5a2kvVHJh?=
 =?utf-8?B?UTdUY0ZlOGRSUW5na3RSc0hWRHFOOUZzblVWYytwakpYeUVyU1g0ZDIxK0s1?=
 =?utf-8?B?VjB5WWlHOGVXTXZUek9CZEVpM2RxZ1hiYmJZR1d0dzY4SzdsQkJVKzU1Tkg2?=
 =?utf-8?B?QmtoeU8wcWdBaE0xZ1B6TDlwcTdHdy9FUDJXd29kOWV6Q0tPYWhxQXU3Tm5F?=
 =?utf-8?B?QlRYaS8vL3Nkenl3ZnN2VjFHaU10N3d2MWpFL2h6NGhpTFkrVXFiNlN2a2lJ?=
 =?utf-8?B?MnZCRXZuNU1LU1dzcmhNc3VqdndiMkI0Z3UxbXY0T013a3k4M28vQ0JsU2hn?=
 =?utf-8?B?QjhMN3BzV1FOTS9QZnIrZ2hMZFAwcVdtdVJhcnlPSVFod0l2VjBUYVhnODNV?=
 =?utf-8?B?azlrMFFsQ0l6L1E2YmFUYkdsWVFkaUtYbTR0eFZOdCtoR0phNm16WGhDZGpt?=
 =?utf-8?B?UC9rdmJ0bEFFRzZIRUdzbDJCWDlTS044RWVhektCcWwvdm9SSCtrOTd6MHJ3?=
 =?utf-8?B?N0c2cFRBU1FFNVZBeVB4Y3NUQWh4UTlXVmVSTnBwT0dFeENRYlFkNFVGZlBP?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA5B39FF3A445B45A0042697D7708256@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9a0c14-97da-4d3b-329d-08db810ecce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 06:27:56.9443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpoZHs84EIaOO3STjVY4/4hOrsiqy2zIOWisgek0K0kVKrVEyrMO7VWp4BIOfyHy87Db8c6eR7OCrpqeJJM+mZSVHuwxYzNIdXMjtQ7q/vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8274
X-Proofpoint-ORIG-GUID: LDiZLW1aqWHTnqMTlbE9PJTzortJe2lo
X-Proofpoint-GUID: LDiZLW1aqWHTnqMTlbE9PJTzortJe2lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100059
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpIaSBSb2IsDQoNClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyaXRlczoNCg0KPiBP
biBGcmksIEp1bCA3LCAyMDIzIGF0IDEwOjEw4oCvQU0gT2xla3NpaSBNb2lzaWVpZXYNCj4gPE9s
ZWtzaWlfTW9pc2llaWV2QGVwYW0uY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4gSGkgUm9iLA0KPj4N
Cj4+IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+DQo+PiA+IE9uIEZy
aSwgSnVsIDA3LCAyMDIzIGF0IDAyOjA3OjE4UE0gKzAwMDAsIE9sZWtzaWkgTW9pc2llaWV2IHdy
b3RlOg0KPj4gPj4NCj4+ID4+IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBm
b3NzLnN0LmNvbT4gd3JpdGVzOg0KPj4gPj4NCj4+ID4+ID4gZmVhdHVyZS1kb21haW5zIGlzIGFu
IG9wdGlvbmFsIHByb3BlcnR5IHRoYXQgYWxsb3dzIGEgcGVyaXBoZXJhbCB0bw0KPj4gPj4gPiBy
ZWZlciB0byBvbmUgb3IgbW9yZSBmZWF0dXJlIGRvbWFpbiBjb250cm9sbGVyKHMpLg0KPj4gPj4g
Pg0KPj4gPj4gPiBEZXNjcmlwdGlvbiBvZiB0aGlzIHByb3BlcnR5IGlzIGFkZGVkIHRvIGFsbCBw
ZXJpcGhlcmFsIGJpbmRpbmcgZmlsZXMgb2YNCj4+ID4+ID4gdGhlIHBlcmlwaGVyYWwgdW5kZXIg
dGhlIFNUTTMyIGZpcmV3YWxsIGNvbnRyb2xsZXJzLiBJdCBhbGxvd3MgYW4gYWNjdXJhdGUNCj4+
ID4+ID4gcmVwcmVzZW50YXRpb24gb2YgdGhlIGhhcmR3YXJlLCB3aGVyZSB2YXJpb3VzIHBlcmlw
aGVyYWxzIGFyZSBjb25uZWN0ZWQNCj4+ID4+ID4gdG8gdGhpcyBmaXJld2FsbCBidXMuIFRoZSBm
aXJld2FsbCBjYW4gdGhlbiBjaGVjayB0aGUgcGVyaXBoZXJhbCBhY2Nlc3Nlcw0KPj4gPj4gPiBi
ZWZvcmUgYWxsb3dpbmcgaXQgdG8gcHJvYmUuDQo+PiA+PiA+DQo+PiA+PiA+IFNpZ25lZC1vZmYt
Ynk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4NCj4+
ID4+ID4gLS0tDQo+PiA+PiA+DQo+PiA+PiA+IERpc2NsYWltZXI6IFNvbWUgZXJyb3Igd2l0aCBk
dGJzX2NoZWNrIHdpbGwgYmUgb2JzZXJ2ZWQgYXMgSSd2ZQ0KPj4gPj4gPiBjb25zaWRlcmVkIHRo
ZSBwcm9wZXJ0eSB0byBiZSBnZW5lcmljLCBhcyBSb2IgYXNrZWQNCj4+ID4+ID4NCj4+ID4+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vc3Qsc3RtMzItaGFzaC55
YW1sICB8IDQgKysrKw0KPj4gPj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9zdCxzdG0zMi1kbWEueWFtbCAgICAgIHwgNCArKysrDQo+PiA+PiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3N0LHN0bTMyLWRtYW11eC55YW1sICAgfCA0ICsr
KysNCj4+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc3Qsc3Rt
MzItaTJjLnlhbWwgICAgICB8IDQgKysrKw0KPj4gPj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lpby9hZGMvc3Qsc3RtMzItYWRjLnlhbWwgIHwgNCArKysrDQo+PiA+PiA+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3N0LHN0bTMyLWRmc2RtLWFkYy55YW1s
ICAgICAgfCA0ICsrKysNCj4+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9paW8vZGFjL3N0LHN0bTMyLWRhYy55YW1sICB8IDQgKysrKw0KPj4gPj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvY2VjL3N0LHN0bTMyLWNlYy55YW1sICAgICAgICAgIHwgNCAr
KysrDQo+PiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qs
c3RtMzItZGNtaS55YW1sICAgfCA0ICsrKysNCj4+ID4+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvc3Qsc3RtMzItZm1jMi1lYmkueWFtbCAgICAgICB8IDQgKysrKw0KPj4gPj4g
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi1scHRpbWVy
LnlhbWwgIHwgNCArKysrDQo+PiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sICAgfCA1ICsrKysrDQo+PiA+PiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FybSxwbDE4eC55YW1sICAgICAgICAgfCA0
ICsrKysNCj4+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3Rt
MzItZHdtYWMueWFtbCAgICAgICB8IDQgKysrKw0KPj4gPj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9waHktc3RtMzItdXNicGh5Yy55YW1sIHwgNCArKysrDQo+PiA+
PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Ivc3Qsc3RtMzItdnJlZmJ1Zi55
YW1sICAgICAgfCA0ICsrKysNCj4+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ybmcvc3Qsc3RtMzItcm5nLnlhbWwgICAgICB8IDQgKysrKw0KPj4gPj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9zdCxzdG0zMi11YXJ0LnlhbWwgIHwg
NCArKysrDQo+PiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
c3Qsc3RtMzItaTJzLnlhbWwgICAgfCA0ICsrKysNCj4+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zYWkueWFtbCAgICB8IDQgKysrKw0KPj4g
Pj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItc3BkaWZyeC55YW1s
ICAgICAgICAgIHwgNCArKysrDQo+PiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc3BpL3N0LHN0bTMyLXFzcGkueWFtbCAgICAgfCA0ICsrKysNCj4+ID4+ID4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3Qsc3RtMzItc3BpLnlhbWwgICAgICB8
IDQgKysrKw0KPj4gPj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9k
d2MyLnlhbWwgICAgICAgICAgICAgIHwgNCArKysrDQo+PiA+PiA+ICAyNCBmaWxlcyBjaGFuZ2Vk
LCA5NyBpbnNlcnRpb25zKCspDQo+PiA+PiA+DQo+PiA+PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL3N0LHN0bTMyLWhhc2gueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vc3Qsc3RtMzItaGFzaC55YW1s
DQo+PiA+PiA+IGluZGV4IGI3NjdlYzcyYTk5OS4uZGFmOGRjYWVmNjI3IDEwMDY0NA0KPj4gPj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL3N0LHN0bTMy
LWhhc2gueWFtbA0KPj4gPj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY3J5cHRvL3N0LHN0bTMyLWhhc2gueWFtbA0KPj4gPj4gPiBAQCAtNTAsNiArNTAsMTAgQEAg
cHJvcGVydGllczoNCj4+ID4+ID4gICAgcG93ZXItZG9tYWluczoNCj4+ID4+ID4gICAgICBtYXhJ
dGVtczogMQ0KPj4gPj4gPg0KPj4gPj4gPiArICBmZWF0dXJlLWRvbWFpbnM6DQo+PiA+PiA+ICsg
ICAgbWluSXRlbXM6IDENCj4+ID4+ID4gKyAgICBtYXhJdGVtczogMw0KPj4gPj4gPiArDQo+PiA+
Pg0KPj4gPj4gSSBiZWxpZXdlIGZlYXR1cmUtZG9tYWlucyBpcyBnZW5lcmljIGJpbmRpbmcuIFRo
aXMgbWVhbnMgdGhhdCBtYXhJdGVtcw0KPj4gPj4gY2FuIGJlIGltcGxlbWVudGF0aW9uIGRlcGVu
ZGVuZC4gSSB3b3VsZCByYXRoZXIgZHJvcCBtYXhJdGVtcyBzbyB0aGUNCj4+ID4+IGZvbGxvd2lu
ZyBmb3JtYXQgd2lsbCBiZSBwb3NzaWJsZToNCj4+ID4+DQo+PiA+PiAgICAgICAgICAgZmVhdHVy
ZS1kb21haW5zID0gPCZldHpwYyAxPiwgPCZldHpwYyAyPiwgPCZzb21lX290aGVyX2RvbWFpbiAx
IDIgMyA0Pg0KPj4gPj4gICAgICAgICAgIGZlYXR1cmUtZG9tYWluLW5hbWVzID0gImZpcmV3YWxs
IDEiLCAiZmlyZXdhbGwgMiIsICJvdGhlcl9kb21haW4iDQo+PiA+DQo+PiA+IFRoZSBhYm92ZSBh
bHJlYWR5IGFsbG93cyB0aGlzIChub3QgLW5hbWVzLCBidXQgdGhlIG51bWJlciBvZiBlbnRyaWVz
KS4NCj4+ID4+DQo+PiA+PiBBbHNvIEkgYmVsaWV3ZSBkcml2ZXIgd2lsbCBoYW5kbGUgZmVhdHVy
ZS1kb21haW4tbmFtZXMgcHJvcGVydHkgc28gaXQNCj4+ID4+IHdpbGwgcGFyc2UgZmVhdHVyZS1k
b21haW5zIG9ubHkgcmVsYXRlZCB0byB0aGUgZmlyZXdhbGwuDQo+PiA+DQo+PiA+IE5vdyBJJ20g
Y3VyaW91cy4gV2hhdCdzIGFuIGV4YW1wbGUgdGhhdCdzIG5vdCBhIGZpcmV3YWxsPw0KPj4gPg0K
Pj4gPiAoTm90ZSBJJ20gc3RpbGwgbm90IGhhcHB5IHdpdGggdGhlIG5hbWluZyBvZiAnZmVhdHVy
ZScgYXMgYW55dGhpbmcgaXMgYQ0KPj4gPiBmZWF0dXJlLCBidXQgdGhhdCdzIHRoZSBsZWFzdCBv
ZiB0aGUgaXNzdWVzIHJlYWxseS4pDQo+PiA+DQo+Pg0KPj4gVGhlIGFsdGVybmF0aXZlIHVzYWdl
cyBvZiBmZWF0dXJlLWRvbWFpbnMgd2FzIG9yaWdpbmFsbHkgcHJvcG9zZWQgYnkgbWUNCj4+IGhl
cmU6DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC9jODY5ZDI3NTExMjUxODFhNTViYzhhODhjOTZlM2E4OTJiNDJmMzdhLjE2NjgwNzAy
MTYuZ2l0Lm9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tL19fOyEhR0ZfMjlkYmNRSVVCUEEhekhh
LTFMaEpGWUZDNHZ2QjFPaUtXSjgtTlh2Y0JYTmhzWnVWaS1YbmI0TDZiTlVDNHlwOHRTeUlVTWNL
anlyRUE1X1VtSXFOd1V3Q3ZNeE5uZyQgW2xvcmVbLl1rZXJuZWxbLl1vcmddDQo+Pg0KPj4gQWxz
byBJIHJlbWVtYmVyIFBlbmcgRmFuIGFsc28gd2FzIGludGVyZXN0ZWQgaW4gdGhvc2UgYmluZGlu
Z3MuDQo+DQo+IEl0IGhlbHBzIHRvIENjIHBlb3BsZSB3aGVuIHlvdSB0YWxrIGFib3V0IHRoZW0u
DQo+DQo+IElmIHRoZSBwYXJ0aWVzIGludGVyZXN0ZWQgaW4gdGhpcyB3YW50IHRvIHNlZSBwcm9n
cmVzcyBvbiB0aGlzLCB5b3UNCj4gYWxsIG11c3Qgd29yayB0b2dldGhlciBhbmQgc2hvdyB0aGlz
IGlzIGEgc29sdXRpb24gZm9yIG11bHRpcGxlDQo+IHBsYXRmb3Jtcy4NCj4NCg0KU29ycnkuIE1p
c3NlZCB0aGF0Lg0KDQo+PiBJIHRoaW5rIHRoZSB1c2UtY2FzZSB3aGVuIG9uZSBub2RlIGlzIHBy
b3RlY3RlZCBieSBmaXJld2FsbCBhbmQgYWxzbyBpcw0KPj4gY29udHJvbGxlZCBieSBzY21pIGZl
YXR1cmUtZG9tYWluLWNvbnRyb2xsZXIgKEFzIHdhcyBwcm9wb3NlZCBpbiBteQ0KPj4gcGF0Y2gg
c2VyaWVzKSBtYXkgdGFrZSBwbGFjZS4NCj4NCj4gQnV0IGlzbid0IHRoZSBTQ01JIGRldmljZSBw
cm90ZWN0aW9uIGludGVyZmFjZSB0aGUgc2FtZSB0aGluZz8gU29tZQ0KPiBpbnRlcmZhY2UgdG8g
c2F5ICJjYW4gSSBhY2Nlc3MgdGhpcyBkZXZpY2U/IiBhbmQvb3IgY29udHJvbCBhY2Nlc3MgdG8N
Cj4gaXQuDQoNCk15IHBhdGNoIHNlcmllcyBpbnRyb2R1Y2UgdXNpbmcgb2YgdGhlIGZlYXR1cmUt
ZG9tYWluLWNvbnRyb2xsZXIgdG8NCmNvbnRyb2wgYWNjZXNzIGZvciB0aGUgZGV2aWNlcyBhY3Jv
c3MgdGhlIFZNcy4gSW4gb3VyIGNhc2Ugd2UgaGF2ZQ0KdmlydHVhbGl6ZWQgc3lzdGVtLCBjb250
cm9sbGVkIGJ5IFhlbiBoeXBlcnZpc29yIHdpdGggc29tZSBhbW91bnQgb2YgdGhlDQpWTXMgY2Fs
bGVkIERvbWFpbnMuIEVhY2ggRG9tYWluIGlzIHRoZSBjb21wbGV0ZSBPUyBhbmQgSFcgaXMNCnNl
cGFyYXRlZCBiZXR3ZWVuIHRoZW0uIFdlIG5lZWQgU0NNSSB0byBjb250cm9sIHBvd2VyL2Nsb2Nr
cy9yZXNldHMgZXRjDQpmcm9tIGVhY2ggRG9tYWluLiBmZWF0dXJlLWRvbWFpbi1jb250cm9sbGVy
IGluIG91ciBjYXNlIGlzIFNDTUkgbm9kZSBhbmQNCmVhY2ggZGV2aWNlIHdpbGwgcmVjZWl2ZSB1
bmlxdWUgSUQgd2hpY2ggbWF0Y2ggdGhlIElEIGZyb20gU0NQIGZpcm13YXJlDQp0byBzZXQgdGhl
IGRldmljZSBwZXJtaXNzaW9ucyBzbyB0aGUgU0NQIHdpbGwga25vdyB3aGV0aGVyIHRvIGdpdmUN
CmFjY2VzcyB0byB0aGUgcmVzb3VyY2UgZm9yIHRoZSBEb21haW4gb3Igbm90Lg0KDQpUaG9zZSBm
ZWF0dXJlLWRvbWFpbi1jb250cm9sbGVyIG5vZGUgYW5kIGxpbmtzIGZyb20gZGV2aWNlcyB3aWxs
IGJlDQpwcm9jZXNzZWQgYnkgWGVuIGR1cmluZyBEb21haW4gY3JlYXRpb24gYW5kIHRoZSBEVCBm
b3IgdGhlIERvbWFpbiB3aWxsDQpiZSBnZW5lcmF0ZWQgd2l0aG91dCB0aG9zZSBiaW5kaW5ncy4N
Cg0KU28gcHJvYmFibHkgRmlyZXdhbGwgd2lsbCBub3Qgc2VlIHRoZSBzY21pIHJlbGF0ZWQgbGlu
a3MgaW4gdGhlIGRldmljZQ0Kbm9kZXMsIGJ1dCBJIHRoaW5rIHRoYXQgdGhlIGNhc2Ugd2hlbiB0
aGUgZGV2aWNlIG5vZGUgaXMgbGlua2VkIHRvIG1vcmUNCnRoZW4gb25lIGZlYXR1cmUtZG9tYWlu
LWNvbnRyb2xsZXIgaXMgcG9zc2libGUgYmVjYXVzZSBiaW5kaW5ncyBhcmUgZ2VuZXJpYy4NCg0K
Pg0KPiBUaGUgb3RoZXIgcG9zc2libGUgdXNlIEknbSBhd2FyZSBvZiBpcyBzeXN0ZW0gcGFydGl0
aW9uaW5nLiBPcGVuQU1QIG9yDQo+IHNpbWlsYXIgd2hlcmUgYW4gU29DIGlzIHBhcnRpdGlvbmVk
IGludG8gbXVsdGlwbGUgT1MgaW5zdGFuY2VzIGFuZA0KPiBwZXJpcGhlcmFscyBhcmUgYXNzaWdu
ZWQgdG8gZGlmZmVyZW50IHBhcnRpdGlvbnMuDQo+DQoNCmkuTVggYm9hcmRzIGFyZSBhbHNvIGhh
dmUgc3lzdGVtIHBhcnRpdGlvbmluZyBjb25jZXB0IGluIFNDRlcuDQoNCj4+IEFzIGZvciB0aGUg
bmFtaW5nIG1heWJlIHlvdSBoYXZlIHNvbWUgdGhvdWdodHMgYWJvdXQgYmV0dGVyIG5hbWU/DQo+
DQo+IElmIEkgZGlkLCBJIHdvdWxkIGhhdmUuIFNvbWV0aGluZyB3aXRoICdhY2Nlc3MnIGluIGl0
IGlzIGFzIGZhciBhcyBJJ3ZlIGdvdHRlbi4NCj4NCg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQg
YWNjZXNzLWNvbnRyb2xsZXIgb3IgZmVhdHVyZS1hY2Nlc3MtY29udHJvbGxlcj8NCk1heWJlIGl0
IHdpbGwgZml0IGJldHRlciBoZXJlIGlmIGFsbCBwb3RlbnRpYWwgdXNlIGNhc2VzIGZvciB0aGlz
DQpiaW5naW5zIGlzIHRvIHNheSBpZiB0aGUgZGV2aWNlIGNhbiBiZSBhY2Nlc3NlZC4NCg0KLS0g
DQpUaGFua3MsDQpPbGVrc2lp
